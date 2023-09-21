import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    @JsonKey(name: 'nombre') required String name,
    @JsonKey(name: 'descripcion') required String description,
    @JsonKey(name: 'ingredientes') required List<Ingredient> ingredients,
    @JsonKey(name: 'rendimiento', defaultValue: 1) required int rendimiento,
    @JsonKey(name: 'receta') List<String>? receta,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}

@freezed
class Ingredient with _$Ingredient {
  factory Ingredient({
    @JsonKey(name: 'cant', defaultValue: 0.0) required double quantity,
    @JsonKey(name: 'unit') required String? unit,
    @JsonKey(name: 'description') required String name,
  }) = _Ingredient;

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);
}
