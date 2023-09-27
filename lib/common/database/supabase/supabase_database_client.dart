import 'dart:developer';

import 'package:challenge_bloc/common/database/supabase/models/supabase_recipe.dart';
import 'package:challenge_bloc/features/authentication/domain/recipes_params.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// {@template supabase_database_exception}
/// A generic supabase database exception.
/// {@endtemplate}
abstract class SupabaseDatabaseException implements Exception {
  /// {@macro supabase_database_exception}
  const SupabaseDatabaseException(this.error);

  /// The error which was caught.
  final Object error;
}

/// {@template supabase_user_information_failure}
/// Thrown during the get user information process if a failure occurs.
/// {@endtemplate}
class SupabaseRecipeInformationFailure extends SupabaseDatabaseException {
  /// {@macro supabase_user_information_failure}
  const SupabaseRecipeInformationFailure(super.error);
}

/// {@template supabase_update_user_failure}
/// Thrown during the update user information process if a failure occurs.
/// {@endtemplate}
class SupabaseUpdateRecipeFailure extends SupabaseDatabaseException {
  /// {@macro supabase_update_user_failure}
  const SupabaseUpdateRecipeFailure(super.error);
}

/// {@template supabase_database_recipe}
/// Supabase database recipe
/// {@endtemplate}
class SupabaseDatabaseRecipes {
  /// {@macro supabase_database_recipe}
  const SupabaseDatabaseRecipes({
    required SupabaseClient supabaseClient,
  }) : _supabaseClient = supabaseClient;

  final SupabaseClient _supabaseClient;

  /// Method to get the user information by id
  /// from the profiles database on Supabase.
  Future<List<SupabaseRecipe>> getRecipes(RecipesParams params) async {
    try {
      log('==>>${params.type.toRawValue()}');
      final columns = TableRecipe.values.map((e) => e.value).toList();
      final response = await _supabaseClient
          .from(TableRecipe.tableName)
          .select<PostgrestList>(
            '${columns.join(',')},'
            'ingredient_quantity(id,recipe,'
            'unit(code,name),count,ingredient(code,name))',
          )
          .eq(
            TableRecipe.mealType.value,
            params.type.toRawValue(),
          );
      log('response==>>$response');
      final list = response.map(SupabaseRecipe.fromJson).toList();

      return list;
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(
        SupabaseRecipeInformationFailure(error),
        stackTrace,
      );
    }
  }

  // /// Method to update the user information on the profiles database.
  // Future<void> updateUser({required SupabaseUser user}) async {
  //   try {
  //     final supabaseUser = SupabaseUser(
  //       id: _supabaseClient.auth.currentUser?.id,
  //       userName: user.userName,
  //       companyName: user.companyName,
  //     );

  //     await _supabaseClient.from('account').upsert(supabaseUser.toJson());
  //   } catch (error, stackTrace) {
  //     Error.throwWithStackTrace(
  //       SupabaseUpdateUserFailure(error),
  //       stackTrace,
  //     );
  //   }
  // }
}

enum TableRecipe {
  code,
  quantity,
  mealType,
  name,
  description,
  recipe;

  String get value {
    return switch (this) {
      TableRecipe.code => 'code',
      TableRecipe.quantity => 'quantity',
      TableRecipe.mealType => 'meal_type',
      TableRecipe.name => 'name',
      TableRecipe.description => 'description',
      TableRecipe.recipe => 'recipe',
    };
  }

  static String get tableName => 'recipes';
}
