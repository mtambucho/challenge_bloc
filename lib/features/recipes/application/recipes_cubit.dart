import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_state.dart';
import 'package:challenge_bloc/features/recipes/domain/recipe_value.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit(
    this._recipesRepository,
  ) : super(
          const RecipesState(
            value: RecipeValue.loading(),
            mealType: MealType.breakfast,
          ),
        ) {
    getRecipes();
  }
  final RecipesRepository _recipesRepository;

  Future<void> getRecipes() async {
    final params = RecipesParams(type: state.mealType);
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
