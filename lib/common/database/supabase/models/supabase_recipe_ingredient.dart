import 'package:challenge_bloc/common/database/supabase/models/supabase_ingredient.dart';
import 'package:challenge_bloc/common/database/supabase/models/supabase_unit.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supabase_recipe_ingredient.g.dart';

//  id integer PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
//   ingredient text not null references public.ingredients,
//   recipe text not null references public.recipes,
//   unit text references public.units,
//   count float
@JsonSerializable()
class SupabaseRecipeIngredient extends Equatable {
  /// {@macro supabase_recipe}
  const SupabaseRecipeIngredient({
    required this.id,
    required this.ingredient,
    required this.unit,
    required this.count,
  });

  /// Connect the generated [_$SupabaseRecipeIngredientFromJson] function to the
  /// `fromJson` factory.
  factory SupabaseRecipeIngredient.fromJson(Map<String, dynamic> json) =>
      _$SupabaseRecipeIngredientFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'ingredient')
  final SupabaseIngredient ingredient;

  @JsonKey(name: 'unit')
  final SupabaseUnit unit;

  @JsonKey(name: 'count')
  final num? count;

  @override
  List<Object> get props => [
        id,
        ingredient,
        unit,
        count ?? '',
      ];

  /// Empty Supabase object.
  static const empty = SupabaseRecipeIngredient(
    id: 0,
    ingredient: SupabaseIngredient.empty,
    unit: SupabaseUnit.empty,
    count: 0,
  );

  /// Connect the generated [_$SupabaseRecipeIngredientToJson]
  /// function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SupabaseRecipeIngredientToJson(this);
}
