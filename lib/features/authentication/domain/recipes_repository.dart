import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';

abstract class RecipesRepository {
  ///function to get all recipes
  Future<List<Recipe>> getRecipes(RecipesParams params);
}
