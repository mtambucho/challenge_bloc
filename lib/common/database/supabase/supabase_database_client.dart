import 'package:challenge_bloc/common/database/database_client.dart';
import 'package:challenge_bloc/features/authentication/authentication.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// A generic supabase database exception.
abstract class SupabaseDatabaseException implements Exception {
  const SupabaseDatabaseException(this.error);

  /// The error which was caught.
  final Object error;
}

/// Thrown during the get recipe information process if a failure occurs.
class SupabaseRecipeInformationFailure extends SupabaseDatabaseException {
  const SupabaseRecipeInformationFailure(super.error);
}

/// Supabase database recipe
class SupabaseDatabaseRecipes {
  /// {@macro supabase_database_recipe}
  const SupabaseDatabaseRecipes({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  /// Method to get the recipe information by mealtype
  Future<List<SupabaseRecipe>> getRecipes(RecipesParams params) async {
    try {
      final recipeColumns =
          TableRecipe.values.map((e) => e.value).toList().join(',');
      final ingredientQtyColumns =
          TableIngredientQuantity.values.map((e) => e.value).toList().join(',');
      final ingredientQtyTable = TableIngredientQuantity.tableName;
      final response = await _supabaseClient
          .from(TableRecipe.tableName)
          .select<PostgrestList>(
            '$recipeColumns,$ingredientQtyTable($ingredientQtyColumns)',
          )
          .eq(
            TableRecipe.mealType.value,
            params.type.toRawValue(),
          );
      final list = response.map(SupabaseRecipe.fromJson).toList();

      return list;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SupabaseRecipeInformationFailure(error),
        stackTrace,
      );
    }
  }
}
