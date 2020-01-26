import 'package:flutter/material.dart';
import 'creatDBbdart.dart';
List postComments=[];
int i;
class CommentsPage extends StatefulWidget {
  static const String id = "comments_page";
   int postId;
   CommentsPage(this.postId);
  @override
  _CommentsPageState createState() => _CommentsPageState(postId);
}

class _CommentsPageState extends State<CommentsPage> {
  int postId;
  _CommentsPageState(this.postId);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
               child: Row(
                 children: <Widget>[
                   Padding(
                     padding: EdgeInsets.all(8),
                     child: CircleAvatar(
                       radius: 25,
                       backgroundImage: NetworkImage(
                           'https://img.pngio.com/personal-png-7-png-image-personal-photo-png-2000_2000.png'),
                     ),
                   ),
                   Card(
                     child: Column(
                       children: <Widget>[
                         Text('user name'),
                         commentsList(postId),
                       ],
                     ),
                   ),
                 ],
               ),
              ),
              Expanded(
                child: SizedBox(),
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
    );
  }
}

Widget commentsList(int postId){
  postComments=[];
  getComment(postId);
  if(postComments[i]!= null){
    return ListView.builder(
      itemCount:postComments.length ,
      itemBuilder: (BuildContext context,  i) {
        return Container(
          child: Card(
            child: Text(
                '${ postComments[i]['content']}'
            ),
          ),
        );
      },
    );
  }
}


getComment(int postId) {
  for (i = 0; i < listComments.length; i++) {
   // print(listComments[i]['post_id']);
if(postId == listComments[i]['post_id']){
// print(listComments[i]['content']);
  postComments.add(listComments[i]['content']);
}else{
  return null;
}
}
  //return postComments[i];
}
