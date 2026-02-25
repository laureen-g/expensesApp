import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressedFn;

  AdaptativeButton({required this.label, required this.onPressedFn});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            child: Text(label),
            onPressed: () => onPressedFn,
            color: Colors.purple,
            padding: EdgeInsets.symmetric(horizontal: 20),
          )
        : ElevatedButton(
            onPressed: () => onPressedFn,
            child: Text(label),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.purple,
            ),
          );
  }
}
