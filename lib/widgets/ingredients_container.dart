import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class IngredientsContainer extends StatelessWidget {
  const IngredientsContainer({
    super.key,
    this.onTap,
    required this.imagePath,
    required this.label,
  });

  final String imagePath;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            CachedNetworkImage(
              imageUrl: imagePath,
              width: 100,
              height: 80,
            ),
            Text(
              label,
              style: TextStyles.textStyle16,
            ),
          ],
        ),
      ),
    );
  }
}
