import 'dart:math';

import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/components/transaction_form.dart';

class TransactionUser extends StatefulWidget {

  @override
  _TransactionsUserState createState() => _TransactionsUserState();
}


class _TransactionsUserState extends State<TransactionUser> {

  final _transactions = [
    Transaction(id: 't1', title: 'Novo tênis de corrida', value: 310.56, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 211.30, date: DateTime.now()),
    Transaction(id: 't3', title: 'Mercado', value: 107.03, date: DateTime.now()),
    Transaction(id: 't4', title: 'Cinema', value: 30, date: DateTime.now()),
    Transaction(id: 't5', title: 'Luz', value: 78, date: DateTime.now()),
    Transaction(id: 't6', title: 'Padaria', value: 13, date: DateTime.now()),
    Transaction(id: 't7', title: 'Beach Tennis', value: 47, date: DateTime.now()),
    Transaction(id: 't8', title: 'Show', value: 167, date: DateTime.now()),
    Transaction(id: 't9', title: 'Praia', value: 678, date: DateTime.now()),

  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now()
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionList(_transactions),
        TransactionForm(_addTransaction)
      ],
    );
  }
}