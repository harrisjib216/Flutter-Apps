import 'dart:convert';
import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

class ContactsApi {
  ContactsApi(this.store);

  DbCollection store;

  Handler get router {
    final app = Router();

    app.get('/', (Request req) async {
      final contacts = await store.find().toList();

      return Response.ok(
        json.encode({'contacts': contacts}),
        headers: {
          'Content-type': ContentType.json.mimeType,
        },
      );
    });

    app.post('/', (Request req) async {
      // parse
      final body = await req.readAsString();
      final data = jsonDecode(body);

      // add to server
      await store.insert(data);

      // get from server
      final entry = await store.findOne(where.eq('name', data['name']));

      return Response.ok(
        jsonEncode(entry),
        headers: {
          'Content-Type': ContentType.json.mimeType,
        },
      );
    });

    app.get('/all', (Request req) async {
      final contacts = await store.find().toList();

      return Response.ok(
        jsonEncode(contacts),
        headers: {
          'Content-Type': ContentType.json.mimeType,
        },
      );
    });

    app.get('/<id|.+>', (Request req, String id) async {
      final contact =
          await store.findOne(where.eq('_id', ObjectId.fromHexString(id)));
      return Response.ok(jsonEncode(contact), headers: {
        'Content-Type': ContentType.json.mimeType,
      });
    });

    app.delete('/<id|.+>', (Request req, String id) async {
      await store.deleteOne(where.eq('_id', ObjectId.fromHexString(id)));
      return Response.ok(jsonEncode("{res: \"Contact was deleted\"}"));
    });

    return app;
  }
}
