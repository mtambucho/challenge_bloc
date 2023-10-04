import 'package:challenge_bloc/common/database.dart';
import 'package:challenge_bloc/common/services.dart';
import 'package:challenge_bloc/common/utils.dart';
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
    ///check if recipes are already loaded
    final loaded = recipesLoaded[params.type] ?? false;
    if (loaded) {
      ///if recipes are loaded return from local storage
      return _getRecipesFromLocalStorage(params);
    } else {
      ////if recipes are not loaded return from supabase
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
          supabaseRecipes.map((r) => r.toRecipe(params.language)).toList();
      return list;
    } catch (e) {
      return [];
    }
  }

  List<Recipe> _getRecipesFromLocalStorage(RecipesParams params) {
    try {
      return recipeService.getRecipes(params.type) ?? [];
    } catch (e) {
      return [];
    }
  }

  ///function to get all recipes from jsons
  @override
  Future<Recipe?> getRecipe(RecipeParams params) async {
    final recipe = await databaseClient.getRecipe(params);
    return recipe?.toRecipe(params.language);
  }
}

extension SupabaseRecipeHelper on SupabaseRecipe {
  Recipe toRecipe(Language language) {
    return Recipe(
      code: code,
      description: description[language.code] ?? '',
      ingredients:
          ingredients?.map((e) => e.toIngredient(language)).toList() ?? [],
      receta: recipe[language.code],
      name: name[language.code] ?? '',
      rendimiento: quantity,
      mealType: MealType.fromJson(mealType),
    );
  }
}

extension SupabaseRecipeIngredientHelper on SupabaseRecipeIngredient {
  Ingredient toIngredient(Language language) {
    return Ingredient(
      name: ingredient.name[language.code] ?? '',
      quantity: count?.toDouble() ?? 0.0,
      unit: unit.name[language.code],
    );
  }
}
