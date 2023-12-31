import 'package:bloc_test/bloc_test.dart';
import 'package:challenge_bloc/features/cart/cart.dart';
import 'package:challenge_bloc/features/fav/fav.dart';
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
      const CartState(items: []),
    );

    favCubit = MockFavCubit();
    when(() => favCubit.state).thenReturn(
      const FavState(
        favorites: [],
      ),
    );

    recipesCubit = MockRecipesCubit();
    when(() => recipesCubit.state).thenReturn(
      RecipesState(
        mealType: MealType.breakfast,
        value: const RecipeValue.loading(),
        recipes: [
          Recipe(
            code: 'test',
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
          child: const RecipesView(),
        ),
      );
      expect(recipesCubit.state.recipes?.length, 1);
      expect(recipesCubit.state.value, const RecipeValue.loading());

      final button = find.byKey(const Key('favStarButton'));
      await tester.tap(button);
      verify(() => favCubit.toggleFav()).called(1);
    });
  });
}
