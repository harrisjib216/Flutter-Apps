import 'package:shelf/shelf.dart';

Middleware cors() {
  const headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
    'Access-Control-Allow-Headers': 'Origin, Content-Type',
  };

  return createMiddleware(requestHandler: (Request req) {
    if (req.method == 'OPTIONS') {
      return Response.ok('', headers: headers);
    }

    return null;
  }, responseHandler: (Response res) {
    return res.change(headers: headers);
  });
}
