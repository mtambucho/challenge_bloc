import 'package:challenge_bloc/features/recipes/recipes.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_value.freezed.dart';
part 'recipe_value.g.dart';

@freezed
class RecipeValue with _$RecipeValue {
  const factory RecipeValue(List<Recipe> data) = Data;
  const factory RecipeValue.loading() = Loading;
  const factory RecipeValue.error([String? message]) = ErrorDetails;

  factory RecipeValue.fromJson(Map<String, Object?> json) =>
      _$RecipeValueFromJson(json);
}
