import 'package:flutter/material.dart';
import 'creatDBbdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Database db = await createDb();
  readDatabase(db);
//  if (isDataInserted()) {
//    db = await retrieveDB(getDatabasePath());
//  } else {
//    db = await createDb();
//  }
//  readDatabase(db);
//  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        body: Center(child: Text("test")),
      )),
    );
  }
}
