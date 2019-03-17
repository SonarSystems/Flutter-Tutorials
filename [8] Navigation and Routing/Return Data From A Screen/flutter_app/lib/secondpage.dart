import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String str = "";

  SecondPage({Key key, this.str}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text(str)
        ),
        body: Center(
          child: RaisedButton(
              onPressed: () {
                Navigator.pop(context, "Welcome Back");
              },
              child: Text("Go Back")
          ),
        )
    );
  }
}

