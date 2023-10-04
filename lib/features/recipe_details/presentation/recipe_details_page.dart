import 'package:challenge_bloc/common/services/dynamic_link/dynamic_link.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:challenge_bloc/features/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({
    required this.recipe,
    required this.mealType,
    required this.redirect,
    super.key,
  });
  final Recipe? recipe;
  final MealType? mealType;
  final DeepLinkRedirect? redirect;

  static Page<void> page(
    Recipe? recipe,
    MealType? mealType,
    DeepLinkRedirect? redirect,
  ) =>
      MaterialPage<void>(
        child: RecipeDetailsPage(
          mealType: mealType,
          recipe: recipe,
          redirect: redirect,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeDetailsCubit(
        recipe: recipe,
        redirect: redirect,
        mealType: mealType,
        recipesRepository: context.read<RecipesRepository>(),
        language: context.read<SettingsCubit>().state.language,
      ),
      child: const RecipeDetailsView(),
    );
  }
}
