import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';

///create a cart item widget when the name adn the count of the recipe is shown
///user can change the count of the recipe and delete the recipe from the cart

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    required this.recipe,
    required this.count,
    required this.onCountChanged,
    required this.onRemoved,
    super.key,
  });

  final Recipe recipe;
  final int count;
  final ValueChanged<int> onCountChanged;
  final VoidCallback onRemoved;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(recipe.name),
        leading: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onRemoved,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                onCountChanged(count - 1);
              },
            ),
            Text(count.toString()),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                onCountChanged(count + 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}
