import 'package:flutter/material.dart';
import 'creatDBbdart.dart';
import 'main.dart';
List postComments = [];
int index;

class CommentsPage extends StatefulWidget {
  static const String id = "comments_page";
  int postId;

  CommentsPage(this.postId);

  @override
  _CommentsPageState createState() => _CommentsPageState(postId);
}

class _CommentsPageState extends State<CommentsPage> {
  final myController = TextEditingController();
  int postId;

  _CommentsPageState(this.postId);
@override
  void dispose() {
  myController;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                commentsList(postId, height, width),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      width: width * 0.9,
                      height: height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.person),
                            hintText: 'What are you thinking about ?',
                            labelText: 'What are you thinking about ?',
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.tag_faces)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget commentsList(int postId, double width, double height) {
  postComments = [];
  getComment(postId);
  if (postComments != null) {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          itemCount: postComments.length,
          itemBuilder: (BuildContext context, i) {
            return Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://img.pngio.com/personal-png-7-png-image-personal-photo-png-2000_2000.png'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: getUserName(i),
                                ),
                                Text('${postComments[i]}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

getComment(int postId) {
  for (int i = 0; i < listComments.length; i++) {
    if (postId == listComments[i]['post_id']) {
      postComments.add(listComments[i]['content']);
    }
  }
  return postComments;
}

Widget getUserName(int index) {
  int userId = listComments[index]['user_id'];
  return Text('${listUsers[userId - 1]['first_name']}'
      ' ${listUsers[userId - 1]['last_name']}');
}
