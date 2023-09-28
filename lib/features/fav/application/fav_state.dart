import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:equatable/equatable.dart';

class FavState extends Equatable {
  const FavState({
    this.favorites,
    this.showFavorites = false,
  });
  final List<Recipe>? favorites;
  final bool showFavorites;
  @override
  List<Object> get props => [favorites ?? [], showFavorites];

  FavState copyWith({
    List<Recipe>? favorites,
    bool? showFavorites,
  }) {
    return FavState(
      favorites: favorites ?? this.favorites,
      showFavorites: showFavorites ?? this.showFavorites,
    );
  }
}
