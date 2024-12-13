import 'package:chat_app/constants/text_data/text_constants.dart';
import 'package:chat_app/widgets/ingredients_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.ingredients),
        centerTitle: true,
        backgroundColor: const Color(0xFFE37070),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xFFCA9F9F),
          selectedItemColor: const Color(0xFFE37070),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.abc),
              label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
          ]),
      body: Padding(
        padding: const EdgeInsets.only(top: 170),
        child: GridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 3,
          children: const [
            IngredientsContainer(
                imagePath: ImagePath.vegetableImagePath,
                containerText: TextConstants.vegetables),
            IngredientsContainer(
                imagePath: ImagePath.spicesImagePath,
                containerText: TextConstants.spices),
            IngredientsContainer(
                imagePath: ImagePath.cerealsImagePath,
                containerText: TextConstants.cereals),
            IngredientsContainer(
                imagePath: ImagePath.meatImagePath,
                containerText: TextConstants.meat),
            IngredientsContainer(
                imagePath: ImagePath.fruitImagePath,
                containerText: TextConstants.fruits),
            IngredientsContainer(
                imagePath: ImagePath.seafoodImagePath,
                containerText: TextConstants.seafood),
            IngredientsContainer(
                imagePath: ImagePath.sugarImagePath,
                containerText: TextConstants.sugar),
            IngredientsContainer(
                imagePath: ImagePath.milImagePath,
                containerText: TextConstants.dairy),
            IngredientsContainer(
                imagePath: ImagePath.eggsImagePath,
                containerText: TextConstants.other),
          ],
        ),
      ),
    );
  }
}
