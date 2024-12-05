import 'package:flutter/material.dart';

class CustomStyles {
  static final buttonStyle = ButtonStyle(
    backgroundColor: const WidgetStatePropertyAll(Colors.black),
    shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
    minimumSize: const WidgetStatePropertyAll(Size(0, 60)),
  );
}
