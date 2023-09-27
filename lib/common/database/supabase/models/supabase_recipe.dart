import 'package:challenge_bloc/common/database/supabase/models/supabase_recipe_ingredient.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supabase_recipe.g.dart';

@JsonSerializable()
class SupabaseRecipe extends Equatable {
  /// {@macro supabase_recipe}
  const SupabaseRecipe({
    required this.code,
    required this.quantity,
    required this.mealType,
    required this.name,
    required this.description,
    required this.ingredients,
    Map<String, List<String>>? recipe,
  }) : recipe = recipe ?? const <String, List<String>>{};
  // ,
  // ingre = ingredients ?? const <SupabaseRecipeIngredient>[];

  /// Connect the generated [_$SupabaseRecipeFromJson] function to the
  /// `fromJson` factory.

  factory SupabaseRecipe.fromJson(Map<String, dynamic> json) =>
      _$SupabaseRecipeFromJson(json);

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'quantity')
  final int quantity;

  @JsonKey(name: 'meal_type')
  final String mealType;

  @JsonKey(name: 'name')
  final Map<dynamic, String> name;

  @JsonKey(name: 'description')
  final Map<String, String> description;

  @JsonKey(name: 'recipe')
  final Map<String, List<String>> recipe;

  @JsonKey(name: 'ingredient_quantity')
  final List<SupabaseRecipeIngredient>? ingredients;

  @override
  List<Object> get props => [
        code,
        quantity,
        mealType,
        name,
        description,
        recipe,
        ingredients ?? [],
      ];

  /// Empty Supabase object.
  static const empty = SupabaseRecipe(
    code: '',
    quantity: 0,
    mealType: '',
    name: {},
    description: {},
    recipe: {},
    ingredients: [],
  );

  /// Connect the generated [_$SupabaseRecipeToJson]
  /// function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SupabaseRecipeToJson(this);
}
