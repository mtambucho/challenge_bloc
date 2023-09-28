import 'package:challenge_bloc/common/services/recipe_service.dart';
import 'package:challenge_bloc/features/fav/domain/fav_repository.dart';
import 'package:challenge_bloc/features/recipes/domain/recipe.dart';

class FavRepositoryImpl extends FavRepository {
  FavRepositoryImpl(this.recipeService);
  final RecipeService recipeService;

  @override
  List<Recipe> getFavorites() {
    return recipeService.getFavorites();
  }

  @override
  void saveFavorite(Recipe recipe) {
    recipeService.saveFavorite(recipe);
  }

  @override
  void removeFavorite(Recipe recipe) {
    recipeService.removeFavorite(recipe);
  }
}
