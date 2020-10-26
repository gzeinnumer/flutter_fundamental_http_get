import 'package:flutter/material.dart';

import 'UserModel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  UserModel userModel = null;
  String msg = "Hasil";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Api Demo GET"),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Request(https://reqres.in/api/users/2)"),
              Text("Hasil"),
              Text(
                (userModel != null) ? msg : "Response Disini",
                textAlign: TextAlign.center,
              ),
              RaisedButton(
                onPressed: () {
                  UserModel.callApiGet("2").then((value) {
                    userModel = value;
                    setState(() {
                      msg = '{ "id" : '+value.id+' , "name" : "'+value.name+'" }';
                    });
                  });
                },
                child: Text("GET"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
