import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('log in'),
          ),
        ),
        body: Center(
          
            child: Container(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Card(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter You Email or Phone Number ',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Card(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your password',
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Text('log in'),
                  )
                ],
              ),
            ),

        ),
      ),
    );
  }
}
