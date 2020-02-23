import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'creatDBbdart.dart';
import 'package:sqflite/sqflite.dart';
import 'commentsPage.dart';
import 'logIn.dart';
import 'regiserPage.dart';

var date = DateTime.now();
const color = const Color(0xfdd835);
Database db;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  db = await createDb();
  readDatabase(db);
  runApp(
    MaterialApp(
      home: LogIn(),
//        initialRoute:MyApp.id,
//        routes: {
//          MyApp.id:(context) => MyApp(),
//          CommentsPage.id:(context) => CommentsPage(),
//        },
    ),
  );
}

class MyApp extends StatefulWidget {
  static const String id = "my_app";

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
//      appBar: AppBar(
//        backgroundColor: Colors.pink.shade600,
//        title: Center(
//          child: Text(
//            'Simple Social',
//            style: TextStyle(
//                fontWeight: FontWeight.bold,
//                color: Colors.white,
//                fontSize: 25,
//                fontStyle: FontStyle.italic),
//          ),
//        ),
//      ),
      /////////
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true ,
              floating: true,
              snap:true,
              expandedHeight: 120.0,
              flexibleSpace: const FlexibleSpaceBar(
                centerTitle: true,
                title: Text('Social'),
                // background:,

                //ToDo row text faild
              ),
              title: Text('faxied social'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add_circle),
              tooltip: 'Add new entry',
              onPressed: () { /* ... */ },
            ),
          ],

            ),

            SliverList(
              delegate: SliverChildBuilderDelegate((context,int index ){
                return Container(
                  height: 400,
                  child: Column(
                    children: [
                      Expanded(child: Container(
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
                                      onTap: () {
                                        moreOptions(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                  child: Padding(
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
                                          child: Center(
                                            child: Text('Comment'),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CommentsPage(index + 1)),
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
                      ),),
                    ],
                  ),
                );
              }),
            ),
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
  final _formKey = GlobalKey<FormState>();

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
                                onTap: () {
                                  moreOptions(context);

                                },
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                            child: Padding(
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
                                    child: Center(
                                      child: Text('Comment'),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                      context,
                                        MaterialPageRoute(builder:(context)=>CommentsPage(index+1)),
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
  return Text('${listUsers[userId - 1]['first_name']}'
      ' ${listUsers[userId - 1]['last_name']}');
}

Widget moreOptions(context){
  showDialog(
     context: context,
     builder: (BuildContext context) {
       return Align(
         alignment: Alignment.topLeft,
         child: AlertDialog(
             content : Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(30.0),

                 ),
                 height: 200,
                 width: 50,
                 child: Column(
                   children: ListTile.divideTiles(
                       context: context,
                       tiles: [
                         ListTile(
                           title: Text('Save Post',
                             style: TextStyle(
                               fontWeight:FontWeight.bold,
                               fontStyle: FontStyle.italic,
                             ),
                           ),
                           onTap: () {
                            // Update the state of the app.
                            // ...
                           },
                         ),
                         ListTile(
                           title: Text('Copy Link'
                             ,style: TextStyle(
                               fontWeight:FontWeight.bold,
                               fontStyle: FontStyle.italic,
                             ),
                           ),
                           onTap: () {
                            // Update the state of the app.
                            // ...
                           },
                         ),
                         ListTile(
                           title: Text('Hide The Post'
                             ,style: TextStyle(
                               fontWeight:FontWeight.bold,
                               fontStyle: FontStyle.italic,
                             ),
                           ),
                           onTap: () {
                             // Update the state of the app.
                             // ...
                           },
                         ),

                       ]
                   ).toList(),
                 ),
               ),

         ),
       );
     },
 );


}


//Row(
//              children: <Widget>[
//                Padding(
//                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
//                  child: Container(
//                    width: width * 0.7,
//                    height: height * 0.12,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.all(
//                        Radius.circular(100),
//                      ),
//                    ),
//                    child: Card(
//                      child: TextFormField(
//                        controller: myController,
//                        decoration: const InputDecoration(
//                          icon: Icon(Icons.person),
//                          hintText: 'What are you thinking about ?',
//                          labelText: 'What are you thinking about ?',
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
//                Container(
//                  width: width * 0.2,
//                  child: RaisedButton(
//                    onPressed: () {
//                      insertNewPost(db, myController.text);
//                    },
//                    child: Center(
//                      child: Text('Post'),
//                    ),
//                  ),
//                ),
//              ],
//            ),