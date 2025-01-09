import 'package:chat_app/pages/ingredients/bloc/ingredients_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/cart');
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.circle,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(Icons.shopping_cart, size: 28, color: Colors.white),
            Positioned(
              right: 0,
              top: 0,
              child: BlocBuilder<IngredientsBloc, IngredientsState>(
                builder: (context, state) {
                  if (state.isLoading == false) {
                    return const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
