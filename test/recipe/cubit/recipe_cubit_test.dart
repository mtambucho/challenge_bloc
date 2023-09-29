import 'package:bloc_test/bloc_test.dart';
import 'package:challenge_bloc/common/utils/utils.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipeRpository extends Mock implements RecipesRepositoryImpl {}

void main() {
  final recipeRepository = MockRecipeRpository();
  const language = Language.en;
  const initMealtype = MealType.breakfast;

  group('CounterCubit', () {
    test('initial state is breakfast', () {
      expect(
        RecipesCubit(
          recipeRepository,
          language,
          initMealtype,
        ).state.mealType,
        equals(MealType.breakfast),
      );
    });

    blocTest<RecipesCubit, RecipesState>(
      'change mealtype and recipes when mealtype is changed',
      build: () => RecipesCubit(
        recipeRepository,
        language,
        initMealtype,
      ),
      setUp: () {
        when(
          () => recipeRepository.getRecipes(
            const RecipesParams(type: MealType.lunch, language: language),
          ),
        ).thenAnswer((_) async => []);
      },
      act: (cubit) => cubit.changeMealType(MealType.lunch),
      expect: () => [
        const RecipesState(
          mealType: MealType.lunch,
          value: RecipeValue.loading(),
          recipes: [],
        ),
        const RecipesState(
          mealType: MealType.lunch,
          value: RecipeValue([]),
          recipes: [],
        ),
      ],
    );
  });
  blocTest<RecipesCubit, RecipesState>(
    'emit [RecipeValue.loading, RecipeValue.error] when get recipes fails',
    build: () => RecipesCubit(
      recipeRepository,
      language,
      initMealtype,
    ),
    setUp: () {
      when(
        () => recipeRepository.getRecipes(
          const RecipesParams(type: MealType.lunch, language: language),
        ),
      ).thenThrow(Exception());
    },
    act: (cubit) => cubit.changeMealType(MealType.lunch),
    expect: () => [
      const RecipesState(
        mealType: MealType.lunch,
        value: RecipeValue.loading(),
        recipes: [],
      ),
      const RecipesState(
        mealType: MealType.lunch,
        value: RecipeValue.error('Exception'),
        recipes: [],
      ),
    ],
  );
}
