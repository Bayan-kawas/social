import 'package:flutter/material.dart';

class RegisterIn extends StatefulWidget {
  @override
  _RegisterInState createState() => _RegisterInState();
}

class _RegisterInState extends State<RegisterIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Card(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'First Name',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Card(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Last Name',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Card(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Email Or Phone ',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Card(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: Card(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Password Confairm',
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
