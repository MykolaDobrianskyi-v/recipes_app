import 'package:chat_app/constants/text_data/text_constants.dart';
import 'package:chat_app/pages/home/bloc/home_bloc.dart';
import 'package:chat_app/widgets/ingredients_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';
  static Widget Function(BuildContext) pageBuilder = (_) => const HomePage();
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(TextConstants.ingredients),
          centerTitle: true,
          backgroundColor: const Color(0xFFE37070),
        ),
        bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return BottomNavigationBar(
                backgroundColor: const Color(0xFFCA9F9F),
                selectedItemColor: const Color(0xFFE37070),
                currentIndex: state.selectedIndex ?? 0,
                onTap: (index) => context
                    .read<HomeBloc>()
                    .add(OnItemTapped(selectedIndex: index)),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.abc),
                    label: '',
                  ),
                  BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
                  BottomNavigationBarItem(icon: Icon(Icons.abc), label: ''),
                ]);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 170),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return GridView.count(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: [
                    for (final category in state.ingredientCategory)
                      IngredientsContainer(
                          imagePath: category.imagePath,
                          containerText: category.label),
                  ]);
            },
          ),
        ),
      ),
    );
  }
}
