import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './tansaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      tittle: 'new shoes',
      amount: 44.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      tittle: 'Maid',
      amount: 55.5,
      date: DateTime.now(),
    ),
  ];
  void _addNewTransaction(String txTittle, double txAmount) {
    final newTx = Transaction(
      tittle: txTittle,
      amount: txAmount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTRansaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
