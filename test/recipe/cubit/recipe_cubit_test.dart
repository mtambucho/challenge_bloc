import 'package:bloc_test/bloc_test.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_cubit.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_state.dart';
import 'package:challenge_bloc/features/recipes/domain/recipe_value.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRecipeRpository extends Mock implements RecipesRepositoryImpl {}

void main() {
  final recipeRepository = MockRecipeRpository();
  const locale = Locale('en');
  const initMealtype = MealType.breakfast;

  group('CounterCubit', () {
    test('initial state is breakfast', () {
      expect(
        RecipesCubit(
          recipeRepository,
          locale,
          initMealtype,
        ).state.mealType,
        equals(MealType.breakfast),
      );
    });

    blocTest<RecipesCubit, RecipesState>(
      'change mealtype and recipes when mealtype is changed',
      build: () => RecipesCubit(
        recipeRepository,
        locale,
        initMealtype,
      ),
      setUp: () {
        when(
          () => recipeRepository.getRecipes(
            const RecipesParams(type: MealType.lunch, locale: 'en'),
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
      locale,
      initMealtype,
    ),
    setUp: () {
      when(
        () => recipeRepository.getRecipes(
          const RecipesParams(type: MealType.lunch, locale: 'en'),
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
