import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTexfield extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) submitForm;
  final String label;
  final TextInputType keyboardType;

  AdaptativeTexfield({
    required this.controller,
    required this.submitForm,
    required this.label,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 10
            ),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: submitForm,
              placeholder: label,
              keyboardType: keyboardType,
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 12),
            ),
          )
        : TextField(
            controller: controller,
            onSubmitted: submitForm,
            decoration: InputDecoration(labelText: label),
            keyboardType: keyboardType,
          );
  }
}
