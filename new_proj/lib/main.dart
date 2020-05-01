import 'package:flutter/material.dart';
import 'package:new_proj/result.dart';
import './questions.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';
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
  var _totalSocre = 0;
  void _answerQuestion(int score) {
    _totalSocre += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'questionText': 'whats your fav color?',
        'answers': [
          {'text': 'red', 'score': 1},
          {'text': 'white', 'score': 9},
          {'text': 'green', 'score': 5},
          {'text': 'blue', 'score': 4},
        ],
      },
      {
        'questionText': 'whats your fav animal?',
        'answers': [
          {'text': 'rabbit', 'score': 12},
          {'text': 'dog', 'score': 8},
          {'text': 'goat', 'score': 9},
          {'text': 'you', 'score': 6},
        ],
      },
      {
        'questionText': 'whats your fav role?',
        'answers': [
          {'text': 'student', 'score': 5},
          {'text': 'teacher', 'score': 3},
          {'text': 'vela', 'score': 8},
          {'text': 'busy', 'score': 6},
        ],
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
              : Result(_totalSocre),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
