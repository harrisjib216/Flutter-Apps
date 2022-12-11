import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Contact extends Equatable {
  const Contact._(this.id, this.name, this.initials);

  factory Contact.fromJson(Map<String, dynamic> json) {
    String id = json['_id'];
    String name = json['name'];
    String initials = name[0];

    if (name.contains(" ")) {
      initials += name[name.indexOf(" ") + 1];
    }

    return Contact._(id, name, initials);
  }

  final String id;
  final String name;
  final String initials;

  @override
  List<String> get props => [id, name, initials];
}

class ContactsAPI {
  final _api = Dio(
    BaseOptions(
      baseUrl: 'http://localhost:8081/contacts',
      headers: {
        'Content-Type': ContentType.json.mimeType,
      },
    ),
  );

  Future<List<Contact>> getAllContacts() async {
    final res = await _api.get('/');
    return (res.data['contacts'] as List)
        .map((e) => Contact.fromJson(e))
        .toList();
  }

  Future<Contact> createContact(String name) async {
    final res = await _api.post('/', data: {'name': name});
    return Contact.fromJson(res.data);
  }

  Future deleteContact(String name) async {
    await _api.delete('/$name');
  }
}

class ContactsSocket {
  ContactsSocket()
      : _api = WebSocketChannel.connect(
            Uri.parse('ws://localhost:8081/contacts-ws/'));

  final WebSocketChannel _api;

  Stream<List<Contact>> get stream => _api.stream.map<List<Contact>>((data) {
        final decoded = jsonDecode(data);
        return (decoded as List)
            .map<Contact>((json) => Contact.fromJson(json))
            .toList();
      });

  ValueChanged<String> get send => _api.sink.add;
}
