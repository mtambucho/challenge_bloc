import 'package:challenge_bloc/common/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_params.freezed.dart';
part 'recipe_params.g.dart';

@freezed
class RecipeParams with _$RecipeParams {
  const factory RecipeParams({
    required Language language,
    required String recipeCode,
  }) = _RecipeParams;

  factory RecipeParams.fromJson(Map<String, dynamic> json) =>
      _$RecipeParamsFromJson(json);
}
