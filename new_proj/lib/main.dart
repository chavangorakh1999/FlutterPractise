import 'package:flutter/material.dart';
import './questions.dart';
// void main()
// {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = ['what is your name', 'what is your fav animal'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FIRST APP'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 180),
          child: Column(
            children: [
              Questions(questions[questionIndex]),
              RaisedButton(
                child: Text('Option 1'),
                onPressed: answerQuestion,
              ),
              RaisedButton(
                child: Text('Option 2'),
                onPressed: answerQuestion,
              ),
              RaisedButton(
                child: Text('Option 3'),
                onPressed: answerQuestion,
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
