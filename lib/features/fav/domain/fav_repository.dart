import 'package:challenge_bloc/features/recipes/domain/recipe.dart';

abstract class FavRepository {
  List<Recipe> getFavorites();
  void saveFavorite(Recipe recipe);
  void removeFavorite(Recipe recipe);
}
