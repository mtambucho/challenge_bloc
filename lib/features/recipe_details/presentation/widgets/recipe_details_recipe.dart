import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';

class RecepyDetailsRecipe extends StatelessWidget {
  const RecepyDetailsRecipe({
    required this.recipe,
    super.key,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return RecipeDetailsSection(
      title: context.l10n.preparation,
      items: recipe.receta!.map((e) => e.capitalize()).toList(),
    );
  }
}
