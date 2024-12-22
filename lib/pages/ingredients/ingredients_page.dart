import 'package:chat_app/constants/text_data/text_constants.dart';
import 'package:flutter/material.dart';

class IngredientsPage extends StatelessWidget {
  static const String routeName = '/ingredients';
  static Widget Function(BuildContext) pageBuilder =
      (_) => const IngredientsPage();
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.ingredients),
        centerTitle: true,
        backgroundColor: const Color(0xFFE37070),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          decoration: const BoxDecoration(
            border: Border.fromBorderSide(
              BorderSide(),
            ),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.accessibility_new_sharp),
              SizedBox(
                width: 10,
              ),
              Text('Test'),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.add,
                ),
              ),
              IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.remove,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
