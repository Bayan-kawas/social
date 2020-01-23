import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'creatDBbdart.dart';
import 'package:sqflite/sqflite.dart';
import 'commentsPage.dart';
var date = DateTime.now();
const color = const Color(0xfdd835);

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Database db = await createDb();
  readDatabase(db);
  runApp(
    MaterialApp(
      home: MyApp(),
//        initialRoute:MyApp.id,
//        routes: {
//          MyApp.id:(context) => MyApp(),
//          CommentsPage.id:(context) => CommentsPage(),
//        },
    ),
  );
}

class MyApp extends StatefulWidget {
  static const String id ="my_app";
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade600,
        title: Center(
          child: Text(
            'Simple Social',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25,
                fontStyle: FontStyle.italic),
          ),
        ),
      ),
      /////////
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    width: width * 0.7,
                    height: height * 0.12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Card(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'What are you thinking about ?',
                          labelText: 'What are you thinking about ?',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: width * 0.2,
                  child: RaisedButton(
                    child: Center(
                      child: Text('Post'),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: PostLists()),
          ],
        ),
      ),
    );
  }
}

class PostLists extends StatefulWidget {
  @override
  _PostListsState createState() => _PostListsState();
}

class _PostListsState extends State<PostLists> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if (listPosts != null) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          width: width,
          height: height * 0.6,
          child: ListView.builder(
              itemCount: listPosts.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: height * 0.4,
                  child: Card(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                    'https://img.pngio.com/personal-png-7-png-image-personal-photo-png-2000_2000.png'),
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 6, 0, 2),
                                  child: userName(index),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text('$date'),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width * 0.1,
                            ),
                            Material(
                              shadowColor: Colors.white30,
                              child: InkWell(
                                child: Icon(Icons.more_horiz),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text('${listPosts[index]['content']}'))),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                    top:
                                        BorderSide(color: Colors.grey.shade200),
                                  )),
                                  child: FlatButton(
                                    child: Center(
                                      child: Text('Like'),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                  ),
                                  child: FlatButton(
                                    child: Center(child: Text('Comment'),),
                                    onPressed: (){
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => CommentsPage(index+1)),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          color: Colors.grey.shade200),
                                    ),
                                  ),
                                  child: FlatButton(
                                    child: Center(
                                      child: Text('Share'),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      );
    } else {
      return SizedBox(
        height: 10,
        child: CircularProgressIndicator(),
      );
    }
  }
}

Widget userName(int index) {
  int userId = listPosts[index]['user_id'];
  //print(userId);
  return Text('${listUsers[userId - 1]['first_name']}'
      ' ${listUsers[userId - 1]['last_name']}');
}

//getComments (){
//
//}
//Row(
//children: <Widget>[
//Padding(
//padding: EdgeInsets.only(right: 30),
//child: Container(
//child: FlatButton(
//child: Center(
//child: Text(
//'Home',
//style: TextStyle(
//fontSize: 20, fontWeight: FontWeight.bold),
//),
//),
//onPressed: () {},
//),
//),
//),
//Container(
//child: FlatButton(
//textColor: Colors.white,
//color: Colors.tealAccent,
//highlightColor: Colors.amberAccent,
//// hoverColor: Colors.amberAccent,
//child: Center(
//child: Text(
//'Your Profile',
//style: TextStyle(
//fontSize: 20, fontWeight: FontWeight.bold),
//),
//),
//onPressed: () {},
//),
//),
//],
//),