import 'package:flutter/material.dart';

class RegisterIn extends StatefulWidget {
  @override
  _RegisterInState createState() => _RegisterInState();
}

class _RegisterInState extends State<RegisterIn> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SafeArea(
          child: Expanded(
            child: Center(
              child: Container(
                color: Colors.blue,
                height: 500,
                child: Card(
                  color: Colors.grey.shade100,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            height: 5,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'First Name',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Last Name',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Email Or Phone ',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Password',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Card(
                          child: Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Password Confairm',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 5,
                          ),
                        ),
                        Expanded(
                          child: RaisedButton(
                            onPressed: () {},
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 40),
                            color: Colors.blue.shade100,
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 5,
                          ),
                        ),
                      ],
                    ),
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
