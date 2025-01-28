import 'package:chat_app/data_providers/ingredients_provider.dart';
import 'package:chat_app/data_providers/storage_provider.dart';
import 'package:chat_app/data_providers/user_provider.dart';
import 'package:chat_app/pages/cart/bloc/cart_bloc.dart';
import 'package:chat_app/repositories/ingredients_repository.dart';

import 'package:chat_app/widgets/custom_ingredient_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartWrapper extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget child;

  const CartWrapper({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          child: child,
        ),
        Positioned(
          right: 10,
          bottom: 50,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(
                  width: 2,
                  color: Color(0xFFE37070),
                ),
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Color(0xFFE37070),
              ),
              onPressed: () async => _showModalBottomSheet(context),
              iconSize: 30,
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _showModalBottomSheet(BuildContext context) async {
  await showModalBottomSheet(
    context: context,
    builder: (context) {
      return BlocProvider(
        create: (context) => CartBloc(
            ingredientsRepository: IngredientsRepository(
                storageProvider:
                    StorageProvider(storage: FirebaseStorage.instance),
                ingredientProvider:
                    IngredientsProvider(firestore: FirebaseFirestore.instance),
                userProvider: UserProvider(
                    firestore: FirebaseFirestore.instance,
                    auth: FirebaseAuth.instance))),
        child: SizedBox(
          height: 700,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if (state.cartItems.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                children: [
                  Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  for (final ingredient in state.cartItems)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomIngredientCard(
                        imagePath: ingredient.imageUrl,
                        label: ingredient.label,
                        onPressed: null,
                        category: ingredient.category,
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      );
    },
  );
}
