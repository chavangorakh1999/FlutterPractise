import 'package:flutter/material.dart';
import './new_transaction.dart';

class NewTRansaction extends StatefulWidget {
  final addTx;

  NewTRansaction(this.addTx);

  @override
  _NewTRansactionState createState() => _NewTRansactionState();
}

class _NewTRansactionState extends State<NewTRansaction> {
  final tittleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTittle=tittleController.text;
    final enteredAmount=double.parse(amountController.text);
    if(enteredTittle.isEmpty || enteredAmount<=0 )
    {
      return;
    }
     widget.addTx(enteredTittle,enteredAmount);
     Navigator.of(context).pop();
  }

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
              onSubmitted: (_)=>submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_)=>submitData(),
            ),
            FlatButton(
              child: Text('Sumbit'),
              textColor: Colors.white,
              color: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
