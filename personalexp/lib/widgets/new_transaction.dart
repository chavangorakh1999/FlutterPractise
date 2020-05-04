import 'package:flutter/material.dart';
import './new_transaction.dart';
import './user_transactions.dart';

class NewTRansaction extends StatelessWidget {
  final addTx;
  final tittleController = TextEditingController();
  final amountController = TextEditingController();
  NewTRansaction(this.addTx);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Tittle'),
              // onChanged: (val) => tittleInput = val,
              controller: tittleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: amountController,
            ),
            FlatButton(
              child: Text('Sumbit'),
              textColor: Colors.white,
              color: Colors.purple,
              onPressed: () {
                addTx(
                  tittleController.text,
                  double.parse(amountController.text),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
