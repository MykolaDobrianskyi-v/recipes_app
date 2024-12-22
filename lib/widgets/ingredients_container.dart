import 'package:chat_app/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IngredientsContainer extends StatelessWidget {
  const IngredientsContainer(
      {super.key, required this.imagePath, required this.containerText});

  final String imagePath;
  final String containerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFD3B5B5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imagePath,
            width: 100,
            height: 80,
          ),
          Text(
            containerText,
            style: TextStyles.textStyle16,
          ),
        ],
      ),
    );
  }
}
