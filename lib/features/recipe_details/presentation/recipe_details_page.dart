import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({
    required this.recipe,
    required this.mealType,
    super.key,
  });
  final Recipe recipe;
  final MealType mealType;

  static Page<void> page(
    Recipe recipe,
    MealType mealType,
  ) =>
      MaterialPage<void>(
        child: RecipeDetailsPage(
          mealType: mealType,
          recipe: recipe,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeDetailsCubit(recipe),
      child: RecipeDetailsView(recipe: recipe, mealType: mealType),
    );
  }
}
