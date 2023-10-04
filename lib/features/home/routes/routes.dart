import 'package:challenge_bloc/features/home/home.dart';
import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:challenge_bloc/features/settings/settings.dart';
import 'package:flutter/material.dart';

List<Page<dynamic>> onGenerateHomePages(
  HomeState state,
  List<Page<dynamic>> pages,
) {
  return switch (state.status) {
    HomeStatus.recipes => [
        RecipesPage.page(),
        if (state.showDetails)
          RecipeDetailsPage.page(
            state.selectedRecipe,
            state.selectedMealType,
            state.redirect,
          ),
      ],
    // HomeStatus.excercise => [ExcercisePage.page()],
    // HomeStatus.fasting => [FastingPage.page()],
    HomeStatus.settings => [SettingPage.page()],
    // HomeStatus.challenge => [ChallengePage.page()],
  };
}
