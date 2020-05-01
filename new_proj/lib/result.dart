import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resultHandler;
  Result(this.resultScore, this.resultHandler);

  String get resultPhrase {
// String resultText;
    var resultText = 'You did it';
    if (resultScore <= 15) {
      resultText = "you got it";
    } else if (resultScore <= 20) {
      resultText = 'no problem';
    } else {
      resultText = 'Hey!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz'),
            onPressed: resultHandler,
            textColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
