import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final appBar=AppBar(
        title: Text('I am rich'),
        backgroundColor: Colors.blueGrey[900],
      );
    return MaterialApp(
        home: Scaffold(
      appBar: appBar,
      body: Center(
        child: Container(
          height: 900,
          child: Image(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      backgroundColor: Colors.blueGrey,
    ));
  }
}
