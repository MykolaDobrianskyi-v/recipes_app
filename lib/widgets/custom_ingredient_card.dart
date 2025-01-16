import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/styles/text_styles/text_styles.dart';
import 'package:flutter/material.dart';

class CustomIngredientCard extends StatelessWidget {
  final String? imagePath;
  final String? label;
  final String? category;

  final Function()? onPressed;

  const CustomIngredientCard({
    super.key,
    required this.imagePath,
    required this.label,
    required this.onPressed,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: imagePath!,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label!,
              style: TextStyles.textStyle16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: onPressed,
            child: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
