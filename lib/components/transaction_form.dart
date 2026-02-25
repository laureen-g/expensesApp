import 'package:flutter/material.dart';
import 'package:expenses/components/adaptative_button.dart';
import 'package:expenses/components/adaptative_texField.dart';
import 'package:expenses/components/adaptative_datePicker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime? _selectedDate = DateTime.now();

  _submitForm() {
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0 || value.isNaN || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value, _selectedDate!);
  }



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: 20 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              AdaptativeTexfield(
                controller: _titleController,
                submitForm: (_) => _submitForm(),
                label: 'Título'
              ),
              AdaptativeTexfield(
                controller: _titleController,
                submitForm: (_) => _submitForm(),
                label: 'Valor (R\$)',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
                AdaptativeDatePicker(selectedDate: _selectedDate, onDateChange: (newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressedFn: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
