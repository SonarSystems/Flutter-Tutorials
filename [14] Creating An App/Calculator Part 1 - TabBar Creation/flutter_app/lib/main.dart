import 'package:flutter/material.dart';
import 'AdditionTab.dart';
import 'MultiplicationTab.dart';
import 'SubtractionTab.dart';
import 'DivisionTab.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AdditionTab additionTab = AdditionTab();
  SubtractionTab subtractionTab = SubtractionTab();
  DivisionTab divisionTab = DivisionTab();
  MultiplicationTab multiplicationTab = MultiplicationTab();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 4,
            child: Scaffold(
                appBar: AppBar(
                    bottom: TabBar(
                        indicatorColor: Colors.white,
                        tabs: [
                          Tab(text: "Addition"),
                          Tab(text: "Subtraction"),
                          Tab(text: "Multiplication"),
                          Tab(text: "Division"),
                        ]
                    ),

                    title: Text("Calculator")
                ),

                body: TabBarView(
                    children: [
                      additionTab,
                      subtractionTab,
                      multiplicationTab,
                      divisionTab,
                    ]
                )
            )
        )
    );
  }
}
