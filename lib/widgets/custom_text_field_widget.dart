import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.obscureText,
      this.controller,
      this.hintText,
      this.onChange});

  final bool obscureText;
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[800]),
        hintText: hintText,
        fillColor: Colors.white70,
      ),
      obscureText: obscureText,
      controller: controller,
      onChanged: onChange,
    );
  }
}
