import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {


  final _titleController = TextEditingController();
  final _valueController = TextEditingController();


  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if(title.isEmpty || value <= 0 || value.isNaN) {
      return;
    }

    onSubmit(title, value);
  }

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
                    onSubmitted: (_) => _submitForm(),
                    decoration: InputDecoration(
                      labelText: 'Título'
                    ),
                  ),
                  TextField(
                    controller: _valueController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => _submitForm(),
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
                        onPressed: _submitForm,
                      ),
                    ],
                  )
                ],
              ),
            )
          );
  }
}