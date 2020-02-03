import 'package:flutter/material.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title:Center(
          child: Text('log in'),
        ),),
        body: Column(
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
                    hintText: 'What are you thinking about ?',
                    labelText: 'What are you thinking about ?',
                  ),
                ),
              ),
            ),
            TextFormField(),
            FlatButton(
              child: Text('log in'),
            )
          ],
        ),
      ),
    );
  }
}
