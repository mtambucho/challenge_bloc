import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/fav/fav.dart';
import 'package:challenge_bloc/features/home/home.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesItem extends StatelessWidget {
  const RecipesItem({
    required this.recipe,
    required this.onTap,
    required this.color,
    required this.inCart,
    super.key,
  });

  final Recipe recipe;
  final VoidCallback onTap;
  final Color color;
  final bool inCart;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            _Buttons(
              recipe: recipe,
              onTap: () {
                context.read<CartCubit>().addOrRemoveItem(recipe);
              },
              color: color,
              inCart: inCart,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      recipe.name.toUpperCase(),
                      style: HomeStyle.itemTitle,
                    ),
                  ),
                  ConstrainedBox(
                    constraints: const BoxConstraints(minHeight: 80),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          recipe.description,
                          style: HomeStyle.item,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: AppColors.grey,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.recipe,
    required this.onTap,
    required this.color,
    required this.inCart,
  });

  final Recipe recipe;
  final VoidCallback onTap;
  final Color color;
  final bool inCart;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<FavCubit>();
    final isFavorite = controller.isFavorite(recipe);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<FavCubit, FavState>(
          builder: (context, state) {
            return FavRecipeWidget(
              isFavorite: isFavorite,
              onPressed: () {
                if (isFavorite) {
                  controller.removeFavorite(recipe);
                } else {
                  controller.addFavorite(recipe);
                }
              },
            );
          },
        ),
        IconButton(
          icon: Icon(
            inCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
            color: inCart ? AppColors.primary : Colors.grey.shade700,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          onPressed: onTap,
        ),
      ],
    );
  }
}
