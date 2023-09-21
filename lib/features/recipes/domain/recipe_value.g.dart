// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Data _$$DataFromJson(Map<String, dynamic> json) => _$Data(
      (json['data'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DataToJson(_$Data instance) => <String, dynamic>{
      'data': instance.data,
      'runtimeType': instance.$type,
    };

_$Loading _$$LoadingFromJson(Map<String, dynamic> json) => _$Loading(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoadingToJson(_$Loading instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$ErrorDetails _$$ErrorDetailsFromJson(Map<String, dynamic> json) =>
    _$ErrorDetails(
      json['message'] as String?,
      json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ErrorDetailsToJson(_$ErrorDetails instance) =>
    <String, dynamic>{
      'message': instance.message,
      'runtimeType': instance.$type,
    };
