import 'package:chat_app/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class IngredientsContainer extends StatelessWidget {
  const IngredientsContainer(
      {super.key, required this.imagePath, required this.containerText});

  final String imagePath;
  final String containerText;

  @override
  Widget build(BuildContext context) {
    final double containerWidth = MediaQuery.of(context).size.width / 3 - 20;
    final double containerHeight = containerWidth * 1.2;

    return SafeArea(
      child: Container(
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          color: const Color(0xFFD3B5B5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: containerWidth * 0.8,
              height: containerHeight * 0.6,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              containerText,
              style: TextStyles.textStyle16,
            ),
          ],
        ),
      ),
    );
  }
}
