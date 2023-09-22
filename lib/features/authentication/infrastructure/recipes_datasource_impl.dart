import 'dart:convert';
import 'dart:developer';

import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/services.dart';

class RecipesDataSource {
  ///function to get all recipes from jsons
  Future<List<Recipe>> getRecipes(RecipesParams params) async {
    try {
      final recipes = List<Recipe>.empty(growable: true);
      for (var i = 1; i <= 7; i++) {
        final list = await _getRecipesForWeek(params, i);
        recipes.addAll(list);
      }
      return recipes;
    } catch (e) {
      log('==>>$e');
      return [];
    }
  }

  ///auxiliar function to get recipes for a week
  Future<List<Recipe>> _getRecipesForWeek(
    RecipesParams params,
    int week,
  ) async {
    try {
      final recetas = <Recipe>[];
      final filename = 's${week}_${params.type.toRawValue()}';
      final json = await rootBundle.loadString('assets/recetas/$filename.json');
      final jsonResponse = jsonDecode(json) as List<dynamic>;
      for (final element in jsonResponse) {
        final receta = Recipe.fromJson(element as Map<String, dynamic>);
        recetas.add(receta);
      }
      return recetas;
    } catch (e) {
      log('==>>$e');
      return [];
    }
  }
}
