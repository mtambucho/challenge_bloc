import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailItem extends StatelessWidget {
  const RecipeDetailItem({
    required this.mealType,
    required this.recipe,
    required this.recipesAmount,
    super.key,
  });
  final MealType mealType;
  final Recipe recipe;
  final int recipesAmount;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mealType.toStringValue(context.l10n).toUpperCase(),
                style: RecipeDetailsStyles.mealTypeStyle,
              ),
              const SizedBox(height: 8),
              Text(
                recipe.name,
                style: RecipeDetailsStyles.titleStyle,
              ),
              RecipeDetailsIcons(
                portions: recipesAmount,
                onChange: context.read<RecipeDetailsCubit>().changeAmount,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              IngredientsWidget(
                recipe: recipe,
                people: recipesAmount,
              ),
              if (recipe.receta != null && (recipe.receta?.isNotEmpty ?? false))
                RecepyDetailsRecipe(recipe: recipe),
            ],
          ),
        ),
      ],
    );
  }
}
