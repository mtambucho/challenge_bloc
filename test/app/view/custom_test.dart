import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter_test/flutter_test.dart';

///create a unit test where list all the recipes

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('Counter', () {
    test('Initial value is 0', () async {
      final recipes = List<Recipe>.empty(growable: true);
      final ds = RecipesDataSource();
      const mealTypes = MealType.values;
      for (final mealType in mealTypes) {
        final params = RecipesParams(type: mealType, locale: 'es');
        final list = await ds.getRecipes(params);
        recipes.addAll(list);
      }
      final ingredients = recipes
          .map((e) => e.ingredients.map((e) => e.name).toList())
          .toList();
      //remove duplicates
      final ingredientsList = ingredients.expand((i) => i).toSet().toList();
      // print(ingredientsList);
      expect(ingredientsList.length, 127);
    });
  });
}
