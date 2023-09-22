import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/fav/fav.dart';
import 'package:challenge_bloc/features/recipes/presentation/widgets/recipes_item.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesList extends StatelessWidget {
  const RecipesList(this.recipes, this.type, this.onSelected, {super.key});
  final List<Recipe> recipes;
  final void Function(Recipe) onSelected;
  final MealType type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        late List<Recipe> recipesToShow;
        final showFavorites = context.read<FavCubit>().state.showFavorites;
        final favoriteRecipes = context.read<FavCubit>().state.favorites ?? [];
        if (showFavorites) {
          recipesToShow = favoriteRecipes;
        } else {
          recipesToShow = [...recipes];
          // ignore: cascade_invocations
          recipesToShow.sort((a, b) {
            final aFav = favoriteRecipes.contains(a);
            final bFav = favoriteRecipes.contains(b);
            if (aFav && !bFav) {
              return -1;
            } else if (!aFav && bFav) {
              return 1;
            } else {
              return 0;
            }
          });
        }

        return BlocBuilder<CartCubit, CartState>(
          builder: (context, cartState) {
            return ListView.builder(
              itemCount: recipesToShow.length,
              itemBuilder: (context, index) {
                final itemInCart = cartState.items.firstWhereOrNull(
                  (element) => element.recipe.name == recipes[index].name,
                );
                return Column(
                  children: [
                    RecipesItem(
                      recipe: recipesToShow[index],
                      onTap: () => onSelected.call(recipesToShow[index]),
                      color: type.color(),
                      inCart: itemInCart != null,
                    ),
                    if (index != recipesToShow.length - 1) const Divider(),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }
}
