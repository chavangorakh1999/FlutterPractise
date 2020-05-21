import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
              height: mediaQuery.size.height,
              width: mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 250, 154, 1),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
            ),
          
          Positioned(
            top: 150,
            
            child: Container(
            height: mediaQuery.size.height,
            width: mediaQuery.size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
