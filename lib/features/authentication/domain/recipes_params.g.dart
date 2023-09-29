// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipesParams _$$_RecipesParamsFromJson(Map<String, dynamic> json) =>
    _$_RecipesParams(
      type: $enumDecode(_$MealTypeEnumMap, json['type']),
      language: $enumDecode(_$LanguageEnumMap, json['language']),
    );

Map<String, dynamic> _$$_RecipesParamsToJson(_$_RecipesParams instance) =>
    <String, dynamic>{
      'type': _$MealTypeEnumMap[instance.type]!,
      'language': _$LanguageEnumMap[instance.language]!,
    };

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.morningSnack: 'morningSnack',
  MealType.lunch: 'lunch',
  MealType.snack: 'snack',
  MealType.dinner: 'dinner',
};

const _$LanguageEnumMap = {
  Language.en: 'en',
  Language.es: 'es',
};
