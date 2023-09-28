import 'dart:developer';

import 'package:challenge_bloc/common/database/database_client.dart';
import 'package:challenge_bloc/common/database/supabase/models/supabase_recipe_ingredient.dart';
import 'package:challenge_bloc/common/services/recipe_service.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  RecipesRepositoryImpl({
    required this.recipeService,
    required this.databaseClient,
  }) {
    _init();
  }
  final RecipeService recipeService;
  final SupabaseDatabaseRecipes databaseClient;
  late Map<MealType, bool> recipesLoaded;
  void _init() {
    recipesLoaded = {
      MealType.breakfast: false,
      MealType.morningSnack: false,
      MealType.lunch: false,
      MealType.snack: false,
      MealType.dinner: false,
    };
  }

  ///function to get all recipes from jsons
  @override
  Future<List<Recipe>> getRecipes(RecipesParams params) async {
    final loaded = recipesLoaded[params.type] ?? false;
    if (loaded) {
      return _getRecipesFromLocalStorage(params);
    } else {
      final list = await _getRecipesFromSupabase(params);
      await recipeService.saveRecipes(params.type, list);
      recipesLoaded[params.type] = true;
      return list;
    }
  }

  Future<List<Recipe>> _getRecipesFromSupabase(RecipesParams params) async {
    try {
      final supabaseRecipes = await databaseClient.getRecipes(params);
      final list =
          supabaseRecipes.map((r) => r.toRecipe(params.locale)).toList();
      return list;
    } catch (e) {
      log('==>>$e');
      return [];
    }
  }

  List<Recipe> _getRecipesFromLocalStorage(RecipesParams params) {
    try {
      return recipeService.getRecipes(params.type) ?? [];
    } catch (e) {
      log('==>>$e');
      return [];
    }
  }
}

extension on SupabaseRecipe {
  Recipe toRecipe(String locale) {
    return Recipe(
      code: code,
      description: description[locale] ?? '',
      ingredients:
          ingredients?.map((e) => e.toIngredient(locale)).toList() ?? [],
      receta: recipe[locale],
      name: name[locale] ?? '',
      rendimiento: quantity,
    );
  }
}

extension on SupabaseRecipeIngredient {
  Ingredient toIngredient(String locale) {
    return Ingredient(
      name: ingredient.name[locale] ?? '',
      quantity: count?.toDouble() ?? 0.0,
      unit: unit.name[locale],
    );
  }
}
