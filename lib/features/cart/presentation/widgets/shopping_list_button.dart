import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

///Create a "Comprar" button to finish the purchase
class ShoppingListButton extends StatelessWidget {
  const ShoppingListButton({required this.enabled, super.key});
  final bool enabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: ElevatedButton(
        onPressed: enabled
            ? () {
                ///use go router to navigate to shopping list screen
                context
                    .flow<CartNavState>()
                    .update((state) => CartNavState.shoppingList);
              }
            : null,

        ///rounded borders
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: enabled ? null : Colors.grey,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            context.l10n.shoppingList,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
