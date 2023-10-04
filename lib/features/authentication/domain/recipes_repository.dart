import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';

// ignore: one_member_abstracts
abstract class RecipesRepository {
  ///function to get all recipes
  Future<List<Recipe>> getRecipes(RecipesParams params);

  ///function to get a recipes by code
  Future<Recipe?> getRecipe(RecipeParams params);
}
