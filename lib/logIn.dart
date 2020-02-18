import 'package:flutter/material.dart';
import 'package:posts/main.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('log in'),
          ),
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
              color: Colors.blue,
              height: 300,
              child: Card(
                color: Colors.grey.shade100,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Card(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter You Email or Phone Number ',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Enter your password',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context)=>MyApp()),
                          );
                        },
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        color: Colors.blue.shade100,
                        child: Text(
                          'log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
