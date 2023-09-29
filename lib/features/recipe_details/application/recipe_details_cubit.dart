import 'package:challenge_bloc/features/recipe_details/recipe_details.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recipe_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  RecipeDetailsCubit(this.recipe)
      : super(RecipeDetailsState(recipesAmount: recipe.rendimiento));
  final Recipe recipe;

  void _addAmount() {
    emit(state.copyWith(recipesAmount: state.recipesAmount + 1));
  }

  void _removeAmount() {
    if (state.recipesAmount > 1) {
      emit(state.copyWith(recipesAmount: state.recipesAmount - 1));
    }
  }

  void _setDefaultAmount() {
    if (state.recipesAmount > 1) {
      emit(state.copyWith(recipesAmount: recipe.rendimiento));
    }
  }

  void changeAmount(RecipePortionsChange value) {
    switch (value) {
      case RecipePortionsChange.add:
        _addAmount();
      case RecipePortionsChange.remove:
        _removeAmount();
      case RecipePortionsChange.defaultPortions:
        _setDefaultAmount();
    }
  }
}
