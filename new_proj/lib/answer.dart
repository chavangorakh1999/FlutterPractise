import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function stateHandler;
  final String answerText;

  Answer(this.stateHandler,this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
                child: Text(answerText),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: stateHandler,
              ),
      
    );
  }
}