import 'package:chat_app/styles/button_styles/button_style.dart';
import 'package:chat_app/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({super.key, required this.data, this.onPressed});

  final String data;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: CustomStyles.buttonStyle,
      child: Text(
        data,
        style: TextStyles.textFieldStyle.copyWith(color: Colors.white),
      ),
    );
  }
}
