import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';
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
    var questions = [
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
          child: Column(
            children: [
              Questions(
                questions[questionIndex]['questionText'],
              ),
              ...(questions[questionIndex]['answers'] as List<String>)
                  .map((answer) {
                return Answer(answerQuestion, answer);
              }).toList(),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
