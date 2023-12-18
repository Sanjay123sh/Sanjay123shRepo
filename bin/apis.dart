import 'dart:developer';

import 'package:apis/apis.dart' as apis;
import 'package:apis/server.dart';
import 'package:mongo_dart/mongo_dart.dart';

void main() async {
 List storedItems=[];
  // mongodb+srv://usernameisthis11:<password>@cluster0.xemcquq.mongodb.net/
 var db = await Db.create("mongodb+srv://usernameisthis11:CyZKWKpxIQ9NtzYn@cluster0.xemcquq.mongodb.net/RangatDb?retryWrites=true&w=majority");
  await db.open();
  // // final db = Db('mongodb://localhost:27017/');
  // await db.open();
  var coll =await db.collection('DATATABLE');

  print(await coll.find().toList());
  storedItems=await coll.find().toList();
  print(db.isConnected);
  inspect(db);

  final server = Server();
  await server.start(storedItems);
  // var a = await db.collection("mydata");
  // print(a.find("mydata"));
}
// mb6rvHHvb5z68Bzb
