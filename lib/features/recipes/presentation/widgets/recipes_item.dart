import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/fav/presentation/fav_widget.dart';
import 'package:challenge_bloc/features/home/home.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///create another ItemWidge
///create another ItemWidget but receive a receta and show all the information
///in a blue card with rounded borders
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
      child: ColoredBox(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              _Buttons(
                receta: recipe,
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
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        recipe.description,
                        style: HomeStyle.item,
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
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
    required this.receta,
    required this.onTap,
    required this.color,
    required this.inCart,
  });

  final Recipe receta;
  final VoidCallback onTap;
  final Color color;
  final bool inCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FavRecipeWidget(
          recipe: receta,
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
