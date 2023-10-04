// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeParams _$$_RecipeParamsFromJson(Map<String, dynamic> json) =>
    _$_RecipeParams(
      language: $enumDecode(_$LanguageEnumMap, json['language']),
      recipeCode: json['recipeCode'] as String,
    );

Map<String, dynamic> _$$_RecipeParamsToJson(_$_RecipeParams instance) =>
    <String, dynamic>{
      'language': _$LanguageEnumMap[instance.language]!,
      'recipeCode': instance.recipeCode,
    };

const _$LanguageEnumMap = {
  Language.en: 'en',
  Language.es: 'es',
};
