import 'package:flutter/material.dart';
import './new_transaction.dart';
import 'package:intl/intl.dart';

class NewTRansaction extends StatefulWidget {
  final addTx;

  NewTRansaction(this.addTx);

  @override
  _NewTRansactionState createState() => _NewTRansactionState();
}

class _NewTRansactionState extends State<NewTRansaction> {
  final _tittleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTittle = _tittleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTittle.isEmpty || enteredAmount <= 0||_selectedDate==null) {
      return;
    }
    widget.addTx(enteredTittle, enteredAmount,_selectedDate);
    Navigator.of(context).pop();
  }

  void _percentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        } 
         setState(() {
           _selectedDate = pickedDate;
         }); 
      },
    );
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
              controller: _tittleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Text(
                      _selectedDate == null
                          ? 'No date selected'
                          :'Selected Date: ${DateFormat.yMd().format(_selectedDate)}',
                    ),
                  ),
                  Expanded(
                        child: FlatButton(
                        onPressed: _percentDatePicker,
                        child: Text(
                          'Choose Date',
                          style: Theme.of(context).textTheme.button,
                        )),
                  ),
                ],
              ),
            ),
            FlatButton(
              child: Text('Sumbit'),
              textColor: Colors.white,
              color: Colors.purple,
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
