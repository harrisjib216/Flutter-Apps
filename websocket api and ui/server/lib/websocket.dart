import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ContactsWebSocket {
  ContactsWebSocket(this.store);

  List<WebSocketChannel> _clients = [];
  DbCollection store;

  Handler get router {
    return webSocketHandler((WebSocketChannel socket) {
      socket.stream.listen((event) async {
        final data = json.decode(event);

        if (data['action'] == 'create') {
          await store.insert(data['payload']);
        }

        if (data['action'] == 'delete') {
          // final x =
          //     await store.find(where.eq('name', 'Arely Nitzsche')).toList();
          // print(x);
          await store.deleteOne({'name': data['name']});
        }

        final contacts = await store.find().toList();
        sendToClients(contacts);
      });

      _clients.add(socket);
    });
  }

  void sendToClients(dynamic data) {
    data = jsonEncode(data);

    for (final client in _clients) {
      client.sink.add(data);
    }
  }
}
