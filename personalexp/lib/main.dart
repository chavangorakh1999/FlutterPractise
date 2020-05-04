import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:personalexp/widgets/user_transactions.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String tittleInput;
  // String amountInput;
  final tittleController= TextEditingController();
  final amountController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyExpences'),
      ),
      body:  SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Colors.blue,
              child: Card(
                child: Text('Chart!'),
                elevation: 10,
              ),
            ),
           UserTransaction(),
          ],
        ),
      ),
    );
  }
}
