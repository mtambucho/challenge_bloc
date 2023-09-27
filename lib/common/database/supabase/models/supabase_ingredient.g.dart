// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupabaseIngredient _$SupabaseIngredientFromJson(Map<String, dynamic> json) =>
    SupabaseIngredient(
      code: json['code'] as String,
      name: Map<String, String>.from(json['name'] as Map),
    );

Map<String, dynamic> _$SupabaseIngredientToJson(SupabaseIngredient instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };
