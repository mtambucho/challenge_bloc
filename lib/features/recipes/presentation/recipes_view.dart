import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/appbar/appbar.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_cubit.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_state.dart';
import 'package:challenge_bloc/features/recipes/presentation/widgets/recipes_item.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesView extends StatelessWidget {
  const RecipesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<RecipesCubit>().getRecipes();
    return BlocBuilder<RecipesCubit, RecipesState>(
      builder: (context, state) {
        return Scaffold(
          appBar: CustomAppBar(
            titleImage: state.mealType.imageURL(),
            title: state.mealType.toStringValue(context.l10n),
            showFav: true,
          ),
          body: Column(
            children: [
              MealsBubbles(
                onSelected: context.read<RecipesCubit>().changeMealType,
                selected: state.mealType,
                canChangeCategory: true,
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    return state.value.when(
                      (data) => RecipesList(data, state.mealType, (recipe) {}),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      error: (error) => Text(error.toString()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class RecipesList extends StatelessWidget {
  const RecipesList(this.recipes, this.type, this.onSelected, {super.key});
  final List<Recipe> recipes;
  final void Function(Recipe) onSelected;
  final MealType type;

  @override
  Widget build(BuildContext context) {
    // late List<Recipe> recetas;
    // final cart = ref.watch(cartProvider);
    // final showFavorites = ref.watch(showFavoriteProvider);
    // if (showFavorites) {
    //   final favorites = ref.watch(favProvider);

    //   recetas = recipes.where(favorites.contains).toList();
    // } else {
    //   recetas = recipes;

    //   ///show favorites first

    // }
    final recipesToShow = recipes;
    //  recipesToShow.sort((a, b) {
    //     final aFav = ref.watch(favProvider).contains(a);
    //     final bFav = ref.watch(favProvider).contains(b);
    //     if (aFav && !bFav) {
    //       return -1;
    //     } else if (!aFav && bFav) {
    //       return 1;
    //     } else {
    //       return 0;
    //     }
    //   });

    return ListView.builder(
      itemCount: recipesToShow.length,
      itemBuilder: (context, index) {
        // final itemInCart = cart.firstWhereOrNull(
        //   (element) => element.recipe.name == recetas[index].name,
        // );
        const itemInCart = null;
        return Column(
          children: [
            RecipesItem(
              receta: recipesToShow[index],
              onTap: () => onSelected.call(recipesToShow[index]),
              color: type.color(),
              inCart: itemInCart != null,
            ),
            if (index != recipesToShow.length - 1) const Divider(),
          ],
        );
      },
    );
  }
}
