import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mock_data/mock_data.dart';
import 'package:collection/collection.dart';
import 'dart:math';
import 'package:lipsum/lipsum.dart' as lipsum;

String firstName;
String lastName;
int i;
String postContent;
String commentContent;
var randomNum = new Random();
int randomUserId;
int randomPostId;
List<Map> listPosts;

Future createDb() async {
  // get a location
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath,
      'demo.db'); //join is not defined without import path package
  // open database
//  await deleteDatabase(path);

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
    await insertData(db);
  });
  return database;
}

Future insertData(Database database) async {
  int i;
  for (i = 0; i < 10; i++) {
    firstName = mockName();
    lastName = mockName();
    //insert data into  users table
    await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO users(first_name, last_name) VALUES('$firstName', '$lastName')");
    });
  }
  //insert data into posts table
  for (i = 0; i < 50; i++) {
    postContent = lipsum.createParagraph();
    randomUserId = randomNum.nextInt(10) + 1;
    await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO posts(content, user_id) VALUES('$postContent', '$randomUserId')");
    });

    int noComments = randomNum.nextInt(6);
    for (int j = 0; j < noComments; j++) {
      randomUserId = randomNum.nextInt(10) + 1;
      commentContent = lipsum.createSentence();
      await database.transaction((txn) async {
        await txn.rawInsert(
            "INSERT INTO comments(content, user_id, post_id) VALUES('$commentContent', '$randomUserId','${i + 1}')");
      });
    }
  }
  //insert data into comments table
  for (int x = 0; x < 10; x++) {
    commentContent = mockString(20);
    randomPostId = randomNum.nextInt(50) + 1;
    randomUserId = randomNum.nextInt(10) + 1;
    await database.transaction((txn) async {
      await txn.rawInsert(
          "INSERT INTO comments(content, user_id, post_id) VALUES('$commentContent', '$randomUserId','$randomPostId')");
    });
  }
}

Future readDatabase(Database database) async {
  List<Map> listUsers = await database.rawQuery('SELECT * FROM users');
  print(listUsers.length);
  listPosts = await database.rawQuery('SELECT * FROM posts');
  print(listPosts.length);
  List<Map> listComments = await database.rawQuery('SELECT * FROM comments ');
  print(listComments.length);
}
