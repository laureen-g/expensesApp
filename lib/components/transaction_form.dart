import 'package:flutter/material.dart';

class TransactionForm extends StatelessWidget {

  
  // final String titleController = TextEditingController();
  // final String valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    // controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Título'
                    ),
                  ),
                  TextField(
                    // controller: valueController,
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
                        onPressed: () => {
                          // print(titleController.toString());
                          // print(valueController.toString());
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