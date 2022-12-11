import 'dart:async';
import 'dart:convert';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:ui/api.dart';
import 'package:ui/contact_listing.dart';

class ContactsSocketScreen extends StatefulWidget {
  const ContactsSocketScreen({required this.api, super.key});

  final ContactsSocket api;

  @override
  State<ContactsSocketScreen> createState() => _ContactsSocketScreenState();
}

class _ContactsSocketScreenState extends State<ContactsSocketScreen> {
  final socketStream = StreamController<List<Contact>>();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  void loadContacts() {
    widget.api
      ..stream.listen((contacts) {
        loading = false;
        socketStream.add(contacts);
      })
      ..send(jsonEncode({"action": 'init'}));
  }

  void refresh() {
    loadContacts();
  }

  void addPerson() {
    final person = Faker().person;

    widget.api.send(jsonEncode({
      "action": "create",
      "payload": {
        "name": "${person.firstName()} ${person.lastName()}",
      },
    }));
  }

  void deletePerson(String name) {
    widget.api.send(jsonEncode({
      "action": "delete",
      "name": name,
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mongo Web Socket Appy"),
      ),
      body: StreamBuilder<List<Contact>>(
        initialData: const [],
        stream: socketStream.stream,
        builder: (context, snapshot) {
          if (loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ContactListing(
            data: snapshot.data!,
            addPerson: addPerson,
            onDelete: deletePerson,
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: refresh,
            tooltip: 'Refresh list',
            backgroundColor: Colors.amber,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: addPerson,
            tooltip: 'Add person',
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.person_add_alt),
          ),
        ],
      ),
    );
  }
}
