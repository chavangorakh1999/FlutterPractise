// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/adaptive_flat_button.dart';
// import './new_transaction.dart';
import 'package:intl/intl.dart';

class NewTRansaction extends StatefulWidget {
  final Function addTx;

  NewTRansaction(this.addTx){
    print('Constructor NewTransaction Widget');
  }

  @override
  _NewTRansactionState createState(){
    print('createState NewTransaction');
    return _NewTRansactionState();}
}


class _NewTRansactionState extends State<NewTRansaction> {
  final _tittleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTRansactionState(){
    print('Constructor NewTransaction State');
  }

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

@override
  void didUpdateWidget(NewTRansaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }
 
 @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enteredTittle = _tittleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTittle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enteredTittle,
      enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _percentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
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
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Text(
                          _selectedDate == null
                              ? 'No date selected'
                              : 'Selected Date: ${DateFormat.yMd().format(_selectedDate)}',
                        ),
                      ),
                    ),
                    AdaptiveFLatButton('Choose Date', _percentDatePicker),
                  ],
                ),
              ),
              RaisedButton(
                child:const Text('Sumbit'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: _submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
