import 'package:flutter/material.dart';
import 'main.dart';
import 'creatDBbdart.dart';
import 'commentsPage.dart';
class PostLists extends StatefulWidget {
  int index;
  PostLists(this.index);
  @override
  _PostListsState createState() => _PostListsState(index);
}

class _PostListsState extends State<PostLists> {
  int index;
  _PostListsState(this.index);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
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
    );
  }
}