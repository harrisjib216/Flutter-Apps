import 'dart:convert';
import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:server/contacts.dart';
import 'package:server/middleware.dart';
import 'package:server/websocket.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

void main(List<String> args) async {
  print("booting");
  // db connection
  final db = await Db.create(
      'mongodb+srv://tutorial:tutdevtime@cluster0.kjqcycg.mongodb.net/test');
  await db.open();

  final contactsCollection = db.collection('contacts');
  print("db connection is successful");

  // server router
  final app = Router();

  // index route
  app.get('/', (Request req) {
    return Response.ok(jsonEncode({'name': 'Jackie'}));
  });

  // contacts endpoints
  app.mount('/contacts', ContactsApi(contactsCollection).router);

  // contacts websocket
  app.mount('/contacts-ws', ContactsWebSocket(contactsCollection).router);

  // server
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(cors())
      .addHandler(app);

  final host = "http://localhost";
  final port = 8081;
  serve(handler, InternetAddress.anyIPv4, port);
  print("server running at: $host:$port");
}
