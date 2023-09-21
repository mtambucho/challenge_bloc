import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/domain/recipe.dart';

abstract class RecipesDataSource {
  ///function to get all recipes
  Future<List<Recipe>> getRecipes(RecipesParams params);
}
