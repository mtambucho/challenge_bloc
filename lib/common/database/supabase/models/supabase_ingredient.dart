import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supabase_ingredient.g.dart';

@JsonSerializable()
class SupabaseIngredient extends Equatable {
  /// {@macro supabase_recipe}
  const SupabaseIngredient({
    required this.code,
    required this.name,
  });

  /// Connect the generated [_$SupabaseIngredientFromJson] function to the
  /// `fromJson` factory.
  factory SupabaseIngredient.fromJson(Map<String, dynamic> json) =>
      _$SupabaseIngredientFromJson(json);

  @JsonKey(name: 'code')
  final String code;

  @JsonKey(name: 'name')
  final Map<dynamic, String> name;
  @override
  List<Object> get props => [
        code,
        name,
      ];

  /// Empty Supabase object.
  static const empty = SupabaseIngredient(
    code: '',
    name: {},
  );

  /// Connect the generated [_$SupabaseIngredientToJson]
  /// function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SupabaseIngredientToJson(this);
}
