import 'dart:developer';

import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  RecipesRepositoryImpl({required this.dataSource});
  final RecipesDataSource dataSource;

  ///function to get all recipes from jsons
  @override
  Future<List<Recipe>> getRecipes(RecipesParams params) async {
    try {
      return dataSource.getRecipes(params);
    } catch (e) {
      log('==>>$e');
      return [];
    }
  }
}
