// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeValue _$RecipeValueFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return Data.fromJson(json);
    case 'loading':
      return Loading.fromJson(json);
    case 'error':
      return ErrorDetails.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RecipeValue',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RecipeValue {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Recipe> data) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Recipe> data)? $default, {
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Recipe> data)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Data value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Data value)? $default, {
    TResult? Function(Loading value)? loading,
    TResult? Function(ErrorDetails value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeValueCopyWith<$Res> {
  factory $RecipeValueCopyWith(
          RecipeValue value, $Res Function(RecipeValue) then) =
      _$RecipeValueCopyWithImpl<$Res, RecipeValue>;
}

/// @nodoc
class _$RecipeValueCopyWithImpl<$Res, $Val extends RecipeValue>
    implements $RecipeValueCopyWith<$Res> {
  _$RecipeValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DataCopyWith<$Res> {
  factory _$$DataCopyWith(_$Data value, $Res Function(_$Data) then) =
      __$$DataCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Recipe> data});
}

/// @nodoc
class __$$DataCopyWithImpl<$Res> extends _$RecipeValueCopyWithImpl<$Res, _$Data>
    implements _$$DataCopyWith<$Res> {
  __$$DataCopyWithImpl(_$Data _value, $Res Function(_$Data) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$Data(
      null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Data implements Data {
  const _$Data(final List<Recipe> data, {final String? $type})
      : _data = data,
        $type = $type ?? 'default';

  factory _$Data.fromJson(Map<String, dynamic> json) => _$$DataFromJson(json);

  final List<Recipe> _data;
  @override
  List<Recipe> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RecipeValue(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Data &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataCopyWith<_$Data> get copyWith =>
      __$$DataCopyWithImpl<_$Data>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Recipe> data) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return $default(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Recipe> data)? $default, {
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return $default?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Recipe> data)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Data value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Data value)? $default, {
    TResult? Function(Loading value)? loading,
    TResult? Function(ErrorDetails value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DataToJson(
      this,
    );
  }
}

abstract class Data implements RecipeValue {
  const factory Data(final List<Recipe> data) = _$Data;

  factory Data.fromJson(Map<String, dynamic> json) = _$Data.fromJson;

  List<Recipe> get data;
  @JsonKey(ignore: true)
  _$$DataCopyWith<_$Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingCopyWith<$Res> {
  factory _$$LoadingCopyWith(_$Loading value, $Res Function(_$Loading) then) =
      __$$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<$Res>
    extends _$RecipeValueCopyWithImpl<$Res, _$Loading>
    implements _$$LoadingCopyWith<$Res> {
  __$$LoadingCopyWithImpl(_$Loading _value, $Res Function(_$Loading) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$Loading implements Loading {
  const _$Loading({final String? $type}) : $type = $type ?? 'loading';

  factory _$Loading.fromJson(Map<String, dynamic> json) =>
      _$$LoadingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RecipeValue.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Recipe> data) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Recipe> data)? $default, {
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Recipe> data)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Data value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Data value)? $default, {
    TResult? Function(Loading value)? loading,
    TResult? Function(ErrorDetails value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LoadingToJson(
      this,
    );
  }
}

abstract class Loading implements RecipeValue {
  const factory Loading() = _$Loading;

  factory Loading.fromJson(Map<String, dynamic> json) = _$Loading.fromJson;
}

/// @nodoc
abstract class _$$ErrorDetailsCopyWith<$Res> {
  factory _$$ErrorDetailsCopyWith(
          _$ErrorDetails value, $Res Function(_$ErrorDetails) then) =
      __$$ErrorDetailsCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ErrorDetailsCopyWithImpl<$Res>
    extends _$RecipeValueCopyWithImpl<$Res, _$ErrorDetails>
    implements _$$ErrorDetailsCopyWith<$Res> {
  __$$ErrorDetailsCopyWithImpl(
      _$ErrorDetails _value, $Res Function(_$ErrorDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ErrorDetails(
      freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ErrorDetails implements ErrorDetails {
  const _$ErrorDetails([this.message, final String? $type])
      : $type = $type ?? 'error';

  factory _$ErrorDetails.fromJson(Map<String, dynamic> json) =>
      _$$ErrorDetailsFromJson(json);

  @override
  final String? message;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RecipeValue.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorDetails &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorDetailsCopyWith<_$ErrorDetails> get copyWith =>
      __$$ErrorDetailsCopyWithImpl<_$ErrorDetails>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<Recipe> data) $default, {
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<Recipe> data)? $default, {
    TResult? Function()? loading,
    TResult? Function(String? message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<Recipe> data)? $default, {
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(Data value) $default, {
    required TResult Function(Loading value) loading,
    required TResult Function(ErrorDetails value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(Data value)? $default, {
    TResult? Function(Loading value)? loading,
    TResult? Function(ErrorDetails value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(Data value)? $default, {
    TResult Function(Loading value)? loading,
    TResult Function(ErrorDetails value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ErrorDetailsToJson(
      this,
    );
  }
}

abstract class ErrorDetails implements RecipeValue {
  const factory ErrorDetails([final String? message]) = _$ErrorDetails;

  factory ErrorDetails.fromJson(Map<String, dynamic> json) =
      _$ErrorDetails.fromJson;

  String? get message;
  @JsonKey(ignore: true)
  _$$ErrorDetailsCopyWith<_$ErrorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
