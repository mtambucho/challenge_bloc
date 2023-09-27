import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'supabase_unit.g.dart';

@JsonSerializable()
class SupabaseUnit extends Equatable {
  /// {@macro supabase_unit}
  const SupabaseUnit({
    required this.code,
    required this.name,
  });

  /// Connect the generated [_$SupabaseUnitFromJson] function to the
  /// `fromJson` factory.
  factory SupabaseUnit.fromJson(Map<String, dynamic> json) =>
      _$SupabaseUnitFromJson(json);

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
  static const empty = SupabaseUnit(
    code: '',
    name: {},
  );

  /// Connect the generated [_$SupabaseUnitToJson]
  /// function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SupabaseUnitToJson(this);
}
