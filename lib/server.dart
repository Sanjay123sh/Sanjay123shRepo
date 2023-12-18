import 'dart:convert';

import 'package:alfred/alfred.dart';
import 'package:mongo_dart/mongo_dart.dart';

class Server {
  final app = Alfred();

  // List data = [1, 2, 3, 4, 5, 6];

  Future start(data) async {
    app.get('/hello', (HttpRequest req, HttpResponse res) async {
      List storedItems = [];
      var db = await Db.create(
          "mongodb+srv://usernameisthis11:CyZKWKpxIQ9NtzYn@cluster0.xemcquq.mongodb.net/RangatDb?retryWrites=true&w=majority");
      await db.open();
      print("jjjjjjj");
      var coll = await db.collection('DATATABLE');
      storedItems = await coll.find().toList();
      print(storedItems.toString());
      return {'date': data.toString()};
    });
    await app.listen(7878);
  }
}
// http://192.168.1.16:7878/hello

