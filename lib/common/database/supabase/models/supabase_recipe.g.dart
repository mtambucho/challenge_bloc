// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supabase_recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupabaseRecipe _$SupabaseRecipeFromJson(Map<String, dynamic> json) =>
    SupabaseRecipe(
      code: json['code'] as String,
      quantity: json['quantity'] as int,
      mealType: json['meal_type'] as String,
      name: Map<String, String>.from(json['name'] as Map),
      description: Map<String, String>.from(json['description'] as Map),
      ingredients: (json['ingredient_quantity'] as List<dynamic>?)
          ?.map((e) =>
              SupabaseRecipeIngredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      recipe: (json['recipe'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$SupabaseRecipeToJson(SupabaseRecipe instance) =>
    <String, dynamic>{
      'code': instance.code,
      'quantity': instance.quantity,
      'meal_type': instance.mealType,
      'name': instance.name,
      'description': instance.description,
      'recipe': instance.recipe,
      'ingredient_quantity': instance.ingredients,
    };
