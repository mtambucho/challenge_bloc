import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit(
    this._recipesRepository,
    this.language,
    MealType mealType,
  ) : super(
          RecipesState(
            value: const RecipeValue.loading(),
            mealType: mealType,
          ),
        );
  final RecipesRepository _recipesRepository;
  final Language language;

  Future<void> getRecipes() async {
    final params = RecipesParams(
      type: state.mealType,
      language: language,
    );
    try {
      final list = await _recipesRepository.getRecipes(params);
      emit(state.copyWith(value: RecipeValue(list)));
    } catch (e) {
      emit(state.copyWith(value: RecipeValue.error(e.toString())));
    }
  }

  void changeMealType(MealType mealType) {
    emit(
      state.copyWith(mealType: mealType, value: const RecipeValue.loading()),
    );
    getRecipes();
  }
}
