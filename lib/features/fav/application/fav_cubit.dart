import 'package:challenge_bloc/features/fav/application/fav_state.dart';
import 'package:challenge_bloc/features/fav/domain/fav_repository.dart';
import 'package:challenge_bloc/features/recipes/domain/recipe.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit(this.repository) : super(const FavState()) {
    loadFavorites();
  }
  final FavRepository repository;

  void loadFavorites() {
    final favorites = repository.getFavorites();
    emit(state.copyWith(favorites: favorites));
  }

  void toggleFav() {
    final showFavorites = !state.showFavorites;
    emit(state.copyWith(showFavorites: showFavorites));
  }

  bool isFavorite(Recipe recipe) {
    return state.favorites?.firstWhereOrNull((x) => x.code == recipe.code) !=
        null;
  }

  void addFavorite(Recipe recipe) {
    repository.saveFavorite(recipe);
    emit(state.copyWith(favorites: repository.getFavorites()));
  }

  void removeFavorite(Recipe recipe) {
    repository.removeFavorite(recipe);
    emit(state.copyWith(favorites: repository.getFavorites()));
  }

  List<Recipe> getFavorites() {
    return state.favorites ?? [];
  }
}
