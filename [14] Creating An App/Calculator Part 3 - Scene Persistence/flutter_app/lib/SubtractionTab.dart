import 'package:flutter/material.dart';

class SubtractionTab extends StatefulWidget {

  @override
  _SubtractionState createState() => _SubtractionState();
}

class _SubtractionState extends State<SubtractionTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  double num1;
  double num2;
  double result = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            onChanged: (String value) {
              num1 = double.parse(value);
            },
          ),
          TextField(
            onChanged: (String value) {
              num2 = double.parse(value);
            },
          ),
          RaisedButton(
            child: Text("Subtract"),
            onPressed: () {
              setState(() {
                result = num1 - num2;
              });
            },
          ),
          Text(
              "$result"
          )
        ],
      ),
    );
  }
}