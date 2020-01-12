import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mock_data/mock_data.dart';
import 'package:collection/collection.dart';
String names = mockName();
String posts = mockString(100);
int i;

Future createDb() async {
  bool dataSeeded = false;
  if (dataSeeded == false) {
    // get a location
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath,
        'demo.db'); //join is not defined without import path package
    // open database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, first_name TEXT, last_name TEXT)');
      await db.execute(
          'CREATE TABLE posts(id INTEGER PRIMARY KEY, content TEXT, user_id INTEGER)');
      await db.execute(
          'CREATE TABLE comments(id INTEGER PRIMARY KEY, content TEXT, user_id INTEGER, post_id INTEGER)');
      await db.execute(
          'CREATE TABLE post_likes(id INTEGER PRIMARY KEY, user_id INTEGER, post_id INTEGER)');
      await db.execute(
          'CREATE TABLE comment_likes(id INTEGER PRIMARY KEY, user_id INTEGER, comment_id INTEGER)');
    });
    // insert some record
    insertData(database);
//    readDatabase(database);
  }
}

Future insertData(Database database) async {
  for (i = 0; i < 10; i++) {
    String firstName = mockName();
    String lastName = mockName();
    await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO users(first_name, last_name) VALUES('$firstName', '$lastName')");
    });
  }
}
Future readDatabase(Database database)async{
  List<Map> list = await database.rawQuery('SELECT * FROM users');
  List<Map> expectedList = [
  {'id':'id', 'first_name': names, 'last_name':names},
  {'id':'id', 'first_name': names, 'last_name': names}
  ];
  print(list);
  print(expectedList);
  assert(const DeepCollectionEquality().equals(list, expectedList));//SECOND PROBLEM

// Count the records
 int count = Sqflite
      .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM users'));
  assert(count == 2);

}