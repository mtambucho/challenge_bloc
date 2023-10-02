// ignore_for_file: prefer_const_constructors
import 'package:challenge_bloc/common/database/database_client.dart';
import 'package:challenge_bloc/common/services/recipe_service.dart';
import 'package:challenge_bloc/common/utils.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSupabaseDatabaseRecipes extends Mock
    implements SupabaseDatabaseRecipes {}

class MockRecipeService extends Mock implements RecipeService {}

void main() {
  late RecipeService recipeService;
  late SupabaseDatabaseRecipes databaseClient;
  late RecipesRepository userRepository;
  late RecipesParams recipesParams;
  late List<SupabaseRecipe> supabaseRecipeList;
  late List<Recipe> recipeList;

  setUp(() {
    supabaseRecipeList = [
      SupabaseRecipe(
        code: 'test',
        quantity: 1,
        mealType: 'test',
        name: const {'en': 'test'},
        description: const {'en': 'test'},
        ingredients: const [
          SupabaseRecipeIngredient(
            id: 1,
            ingredient: SupabaseIngredient(code: 'test', name: {'en': 'test'}),
            unit: SupabaseUnit(code: 'test', name: {'en': 'test'}),
            count: 1,
          ),
        ],
      ),
    ];

    recipesParams =
        RecipesParams(type: MealType.breakfast, language: Language.en);

    recipeList = supabaseRecipeList
        .map(
          (r) => r.toRecipe(recipesParams.language),
        )
        .toList();
    recipeService = MockRecipeService();
    databaseClient = MockSupabaseDatabaseRecipes();
    userRepository = RecipesRepositoryImpl(
      databaseClient: databaseClient,
      recipeService: recipeService,
    );
  });
  group('UserRepository', () {
    test('can be instantiated', () {
      expect(
        RecipesRepositoryImpl(
          databaseClient: databaseClient,
          recipeService: recipeService,
        ),
        isNotNull,
      );
    });

    group('getUser', () {
      test('returns a list of recipes', () async {
        when(
          () => recipeService.saveRecipes(recipesParams.type, recipeList),
        ).thenAnswer((_) => Future.value());
        when(
          () => databaseClient.getRecipes(recipesParams),
        ).thenAnswer((_) async => supabaseRecipeList);

        expect(
          userRepository.getRecipes(recipesParams),
          completion(equals(recipeList)),
        );
        verify(() => databaseClient.getRecipes(recipesParams)).called(1);
      });
    });
  });
}
