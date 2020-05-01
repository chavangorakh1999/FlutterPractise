import 'package:flutter/material.dart';
import './Lines.dart';

class LineControl  extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState (){
    return LineControlState();
  }
}

class LineControlState extends State<LineControl> {
  String _mainText='Good';
  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            RaisedButton(
              onPressed: (){
                setState(() {
                  _mainText='this changed!';
                },);
              },
              child: Text('change text'),
            ),
            Lines(_mainText),
          ],
        );
  }
}