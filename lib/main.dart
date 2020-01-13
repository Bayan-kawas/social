import 'package:flutter/material.dart';
import 'creatDBbdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'findDatabase.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 prefs = await SharedPreferences.getInstance();
  createDb();
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    findDatabase();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SafeArea(child: Scaffold(body: Center(child: Text("test")),)),);
  }
}




