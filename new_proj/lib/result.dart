import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
    Result(this.resultScore);

String get resultPhrase
{
// String resultText;
var resultText='You did it';
if(resultScore <=15)
{
  resultText="you got it";
}
else if(resultScore <=20)
{
  resultText='no problem';
}
else
{
  resultText='Hey!';
}
return resultText;
}

  @override
  Widget build(BuildContext context) {
    return Center(
                  child: Text(resultPhrase,style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),), 
                );
  }
}