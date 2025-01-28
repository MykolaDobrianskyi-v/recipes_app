import 'package:chat_app/constants/text_data/text_constants.dart';
import 'package:chat_app/data_providers/ingredients_provider.dart';
import 'package:chat_app/data_providers/storage_provider.dart';
import 'package:chat_app/data_providers/user_provider.dart';
import 'package:chat_app/pages/cart/bloc/cart_bloc.dart';
import 'package:chat_app/pages/ingredients/bloc/ingredients_bloc.dart';
import 'package:chat_app/repositories/ingredients_repository.dart';
import 'package:chat_app/widgets/cart_wrapper_widget.dart';
import 'package:chat_app/widgets/custom_ingredient_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IngredientsPage extends StatelessWidget {
  static const String routeName = '/ingredients';
  static Widget Function(BuildContext) pageBuilder =
      (_) => const IngredientsPage();
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String?;
    if (category == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(TextConstants.ingredients),
          centerTitle: true,
          backgroundColor: const Color(0xFFE37070),
        ),
        body: const Center(
          child: Text('No category provided.'),
        ),
      );
    }
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IngredientsBloc(
            ingredientsRepository: IngredientsRepository(
              storageProvider:
                  StorageProvider(storage: FirebaseStorage.instance),
              ingredientProvider: IngredientsProvider(
                firestore: FirebaseFirestore.instance,
              ),
              userProvider: UserProvider(
                firestore: FirebaseFirestore.instance,
                auth: FirebaseAuth.instance,
              ),
            ),
            category: category,
          ),
        ),
        BlocProvider(
          create: (context) => CartBloc(
            ingredientsRepository: IngredientsRepository(
              storageProvider:
                  StorageProvider(storage: FirebaseStorage.instance),
              ingredientProvider: IngredientsProvider(
                firestore: FirebaseFirestore.instance,
              ),
              userProvider: UserProvider(
                firestore: FirebaseFirestore.instance,
                auth: FirebaseAuth.instance,
              ),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(TextConstants.ingredients),
          centerTitle: true,
          backgroundColor: const Color(0xFFE37070),
        ),
        body: CartWrapper(
          onTap: null,
          child: BlocBuilder<IngredientsBloc, IngredientsState>(
            builder: (context, state) {
              if (state.isLoading ?? false) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFCA9F9F),
                  ),
                );
              }
              if (state.ingredients.isEmpty) {
                return const Center(
                  child: Text('No ingredients found.'),
                );
              }
              return ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                children: [
                  for (final ingredient in state.ingredients)
                    CustomIngredientCard(
                      imagePath: ingredient.imageUrl,
                      label: ingredient.label,
                      category: ingredient.category,
                      onPressed: () {
                        context.read<IngredientsBloc>().add(
                              OnAddToCart(
                                ingredient: ingredient,
                              ),
                            );
                      },
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
