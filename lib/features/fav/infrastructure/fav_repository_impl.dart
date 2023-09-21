import 'package:challenge_bloc/common/utils/service/local_store_manager.dart';
import 'package:challenge_bloc/features/fav/domain/fav_repository.dart';
import 'package:challenge_bloc/features/recipes/domain/recipe.dart';

class FavRepositoryImpl extends FavRepository {
  FavRepositoryImpl({required LocalStorageManager localStorageManager})
      : _localStorageManager = localStorageManager;

  final LocalStorageManager _localStorageManager;

  @override
  List<Recipe> getFavorites() {
    return _localStorageManager.getFavorites();
  }

  @override
  void saveFavorite(Recipe recipe) {
    _localStorageManager.saveFavorite(recipe);
  }

  @override
  void removeFavorite(Recipe recipe) {
    _localStorageManager.removeFavorite(recipe);
  }
}
