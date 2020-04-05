import 'package:flutter/material.dart';
import 'myHomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bingo_app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//      home: MyHomePage,
      home: MyHomePage(title: 'Bingo with family'),
    );
  }
}
