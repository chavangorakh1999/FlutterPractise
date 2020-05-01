import 'package:flutter/material.dart';
import 'LineControl.dart';

class Lines extends StatelessWidget {
  String mainText;
  Lines(this.mainText);
  @override
  Widget build(BuildContext context) {
    return Text(mainText);
  }
}