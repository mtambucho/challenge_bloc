// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_recipe_ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupabaseRecipeIngredient _$SupabaseRecipeIngredientFromJson(
        Map<String, dynamic> json) =>
    SupabaseRecipeIngredient(
      id: json['id'] as int,
      ingredient: SupabaseIngredient.fromJson(
          json['ingredient'] as Map<String, dynamic>),
      unit: SupabaseUnit.fromJson(json['unit'] as Map<String, dynamic>),
      count: json['count'] as num?,
    );

Map<String, dynamic> _$SupabaseRecipeIngredientToJson(
        SupabaseRecipeIngredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ingredient': instance.ingredient,
      'unit': instance.unit,
      'count': instance.count,
    };
