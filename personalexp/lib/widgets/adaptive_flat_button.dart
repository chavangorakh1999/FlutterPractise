import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptiveFLatButton extends StatelessWidget {
final String text;
final Function handler;

AdaptiveFLatButton(this.text,this.handler);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
                          ? CupertinoButton(
                              child: Text(
                                text,
                                style: Theme.of(context).textTheme.button,
                              ),
                              onPressed:handler,
                            )
                          : FlatButton(
                              onPressed:handler,
                              child: Text(
                                text,
                                style: Theme.of(context).textTheme.button,
                              ));
  }
}