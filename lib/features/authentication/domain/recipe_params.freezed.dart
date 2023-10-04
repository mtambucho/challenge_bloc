// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeParams _$RecipeParamsFromJson(Map<String, dynamic> json) {
  return _RecipeParams.fromJson(json);
}

/// @nodoc
mixin _$RecipeParams {
  Language get language => throw _privateConstructorUsedError;
  String get recipeCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeParamsCopyWith<RecipeParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeParamsCopyWith<$Res> {
  factory $RecipeParamsCopyWith(
          RecipeParams value, $Res Function(RecipeParams) then) =
      _$RecipeParamsCopyWithImpl<$Res, RecipeParams>;
  @useResult
  $Res call({Language language, String recipeCode});
}

/// @nodoc
class _$RecipeParamsCopyWithImpl<$Res, $Val extends RecipeParams>
    implements $RecipeParamsCopyWith<$Res> {
  _$RecipeParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? recipeCode = null,
  }) {
    return _then(_value.copyWith(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      recipeCode: null == recipeCode
          ? _value.recipeCode
          : recipeCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeParamsCopyWith<$Res>
    implements $RecipeParamsCopyWith<$Res> {
  factory _$$_RecipeParamsCopyWith(
          _$_RecipeParams value, $Res Function(_$_RecipeParams) then) =
      __$$_RecipeParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Language language, String recipeCode});
}

/// @nodoc
class __$$_RecipeParamsCopyWithImpl<$Res>
    extends _$RecipeParamsCopyWithImpl<$Res, _$_RecipeParams>
    implements _$$_RecipeParamsCopyWith<$Res> {
  __$$_RecipeParamsCopyWithImpl(
      _$_RecipeParams _value, $Res Function(_$_RecipeParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
    Object? recipeCode = null,
  }) {
    return _then(_$_RecipeParams(
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language,
      recipeCode: null == recipeCode
          ? _value.recipeCode
          : recipeCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeParams implements _RecipeParams {
  const _$_RecipeParams({required this.language, required this.recipeCode});

  factory _$_RecipeParams.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeParamsFromJson(json);

  @override
  final Language language;
  @override
  final String recipeCode;

  @override
  String toString() {
    return 'RecipeParams(language: $language, recipeCode: $recipeCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeParams &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.recipeCode, recipeCode) ||
                other.recipeCode == recipeCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, language, recipeCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeParamsCopyWith<_$_RecipeParams> get copyWith =>
      __$$_RecipeParamsCopyWithImpl<_$_RecipeParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeParamsToJson(
      this,
    );
  }
}

abstract class _RecipeParams implements RecipeParams {
  const factory _RecipeParams(
      {required final Language language,
      required final String recipeCode}) = _$_RecipeParams;

  factory _RecipeParams.fromJson(Map<String, dynamic> json) =
      _$_RecipeParams.fromJson;

  @override
  Language get language;
  @override
  String get recipeCode;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeParamsCopyWith<_$_RecipeParams> get copyWith =>
      throw _privateConstructorUsedError;
}
