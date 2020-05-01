import 'package:flutter/material.dart';
import 'package:flutter_assignment/LineControl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assignment 1'),
        ),
        body: LineControl(),
      ),
    );
  }
}
