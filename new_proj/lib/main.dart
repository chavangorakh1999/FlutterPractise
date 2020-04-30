import 'package:flutter/material.dart';
import 'package:new_proj/result.dart';
import './questions.dart';
import './answer.dart';
import './quiz.dart';
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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'whats your fav color?',
        'answers': ['red', 'orange', 'green', 'blue']
      },
      {
        'questionText': 'whats your fav animal?',
        'answers': ['rabbit', 'dog', 'goat', 'blue whale']
      },
      {
        'questionText': 'whats your fav role?',
        'answers': ['student', 'teacher', 'can\'t say', 'all']
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FIRST APP'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 180),
          child: _questionIndex < _questions.length
              ? Quiz(
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                )
              : Result(),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
