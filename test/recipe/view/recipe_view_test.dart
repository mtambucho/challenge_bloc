// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/fav/application/fav_cubit.dart';
import 'package:challenge_bloc/features/fav/application/fav_state.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_cubit.dart';
import 'package:challenge_bloc/features/recipes/application/recipes_state.dart';
import 'package:challenge_bloc/features/recipes/domain/recipe_value.dart';
import 'package:challenge_bloc/features/recipes/presentation/recipes_view.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/helpers.dart';

class MockRecipesCubit extends MockCubit<RecipesState>
    implements RecipesCubit {}

class MockFavCubit extends MockCubit<FavState> implements FavCubit {}

class MockCartCubit extends MockCubit<CartState> implements CartCubit {}

void main() {
  late RecipesCubit recipesCubit;
  late FavCubit favCubit;
  late CartCubit cartCubit;

  setUp(() async {
    cartCubit = MockCartCubit();
    when(() => cartCubit.state).thenReturn(
      CartState(items: const []),
    );

    favCubit = MockFavCubit();
    when(() => favCubit.state).thenReturn(
      FavState(
        favorites: const [],
      ),
    );

    recipesCubit = MockRecipesCubit();
    when(() => recipesCubit.state).thenReturn(
      RecipesState(
        mealType: MealType.breakfast,
        value: RecipeValue.loading(),
        recipes: const [
          Recipe(
            name: 'Test',
            description: 'Test',
            ingredients: [],
            rendimiento: 1,
          ),
        ],
      ),
    );
  });

  group('Buttons testing', () {
    testWidgets('Toggle favorites when star is clicked', (tester) async {
      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(
              value: recipesCubit,
            ),
            BlocProvider.value(
              value: favCubit,
            ),
            BlocProvider.value(
              value: cartCubit,
            ),
          ],
          child: RecipesView(),
        ),
      );
      expect(recipesCubit.state.recipes?.length, 1);
      expect(recipesCubit.state.value, RecipeValue.loading());

      final button = find.byKey(Key('favStarButton'));
      await tester.tap(button);
      verify(() => favCubit.toggleFav()).called(1);
    });
  });
}
