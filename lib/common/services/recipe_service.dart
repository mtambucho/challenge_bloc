import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:hive/hive.dart';

class RecipeService {
  late Box<Recipe> _favorites;
  late Box<Recipe> _breakfast;
  late Box<Recipe> _morningSnack;
  late Box<Recipe> _lunch;
  late Box<Recipe> _snack;
  late Box<Recipe> _dinner;

  Future<void> init() async {
    _favorites = await Hive.openBox<Recipe>('favorites');
    _breakfast = await Hive.openBox<Recipe>('breakfast');
    _morningSnack = await Hive.openBox<Recipe>('_morningSnack');
    _lunch = await Hive.openBox<Recipe>('lunch');
    _snack = await Hive.openBox<Recipe>('snack');
    _dinner = await Hive.openBox<Recipe>('dinner');
  }

  List<Recipe>? getRecipes(MealType type) {
    return switch (type) {
      MealType.breakfast => _breakfast.values.toList(),
      MealType.morningSnack => _morningSnack.values.toList(),
      MealType.lunch => _lunch.values.toList(),
      MealType.snack => _snack.values.toList(),
      MealType.dinner => _dinner.values.toList(),
    };
  }

  Future<void> saveRecipes(MealType type, List<Recipe> list) async {
    switch (type) {
      case MealType.breakfast:
        await _breakfast.clear();
        await _breakfast.addAll(list);
      case MealType.morningSnack:
        await _morningSnack.clear();
        await _morningSnack.addAll(list);
      case MealType.lunch:
        await _lunch.clear();
        await _lunch.addAll(list);
      case MealType.snack:
        await _snack.clear();
        await _snack.addAll(list);
      case MealType.dinner:
        await _dinner.clear();
        await _dinner.addAll(list);
    }
  }

  List<Recipe> getFavorites() {
    return _favorites.values.toList();
  }

  Future<void> saveFavorite(Recipe recipe) async {
    await _favorites.add(
      Recipe(
        code: recipe.code,
        name: recipe.name,
        description: recipe.description,
        ingredients: recipe.ingredients,
        rendimiento: recipe.rendimiento,
        mealType: recipe.mealType,
      ),
    );
  }

  Future<void> removeFavorite(Recipe recipe) async {
    final itemToRemove = _favorites.values.firstWhere(
      (element) => recipe.name == element.name,
    );
    await itemToRemove.delete();
  }

  void removeCache() {
    _breakfast.clear();
    _morningSnack.clear();
    _lunch.clear();
    _snack.clear();
    _dinner.clear();
  }
}
