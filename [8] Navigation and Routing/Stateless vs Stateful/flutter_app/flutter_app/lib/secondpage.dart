import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  String str = "";

  SecondPage({Key key, this.str}): super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState(str: str);
}

class _SecondPageState extends State<SecondPage> {
  String str = "";

  _SecondPageState({Key key, this.str});

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
                str = "Something else";

                setState(() {

                });
              },
              child: Text("Go Back")
          ),
        )
    );
  }
}

