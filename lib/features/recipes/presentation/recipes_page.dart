import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_cubit.dart';
import 'package:challenge_bloc/features/recipes/presentation/recipes_view.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:challenge_bloc/features/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});
  static Page<void> page() => const MaterialPage<void>(child: RecipesPage());

  @override
  Widget build(BuildContext context) {
    final mealType = calculateMealType();

    return BlocProvider(
      create: (_) => RecipesCubit(
        context.read<RecipesRepository>(),
        context.read<SettingsCubit>().state.language,
        mealType,
      )..getRecipes(),
      child: const RecipesView(),
    );
  }

  MealType calculateMealType() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 10) {
      return MealType.breakfast;
    } else if (hour >= 10 && hour < 12) {
      return MealType.morningSnack;
    } else if (hour >= 12 && hour < 17) {
      return MealType.lunch;
    } else if (hour >= 17 && hour < 20) {
      return MealType.snack;
    } else {
      return MealType.dinner;
    }
  }
}
