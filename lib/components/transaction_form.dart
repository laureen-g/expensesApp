import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {


  final _titleController = TextEditingController();
  final _valueController = TextEditingController();


  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Título'
                    ),
                  ),
                  TextField(
                    controller: _valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)'
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text('Nova Transação'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.purple
                        ),
                        onPressed: () {
                          final title = _titleController.text;
                          final value = double.tryParse(_valueController.text) ?? 0.0;
                          onSubmit(title, value);
                        },
                      ),
                    ],
                  )
                ],
              ),
            )
          );
  }
}