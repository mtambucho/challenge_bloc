// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deeplink_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeepLinkState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DeepLinkRedirect link) linkPending,
    required TResult Function() ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DeepLinkRedirect link)? linkPending,
    TResult? Function()? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DeepLinkRedirect link)? linkPending,
    TResult Function()? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LinkPending value) linkPending,
    required TResult Function(Ready value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LinkPending value)? linkPending,
    TResult? Function(Ready value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LinkPending value)? linkPending,
    TResult Function(Ready value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeepLinkStateCopyWith<$Res> {
  factory $DeepLinkStateCopyWith(
          DeepLinkState value, $Res Function(DeepLinkState) then) =
      _$DeepLinkStateCopyWithImpl<$Res, DeepLinkState>;
}

/// @nodoc
class _$DeepLinkStateCopyWithImpl<$Res, $Val extends DeepLinkState>
    implements $DeepLinkStateCopyWith<$Res> {
  _$DeepLinkStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialCopyWith<$Res> {
  factory _$$InitialCopyWith(_$Initial value, $Res Function(_$Initial) then) =
      __$$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialCopyWithImpl<$Res>
    extends _$DeepLinkStateCopyWithImpl<$Res, _$Initial>
    implements _$$InitialCopyWith<$Res> {
  __$$InitialCopyWithImpl(_$Initial _value, $Res Function(_$Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'DeepLinkState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DeepLinkRedirect link) linkPending,
    required TResult Function() ready,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DeepLinkRedirect link)? linkPending,
    TResult? Function()? ready,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DeepLinkRedirect link)? linkPending,
    TResult Function()? ready,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LinkPending value) linkPending,
    required TResult Function(Ready value) ready,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LinkPending value)? linkPending,
    TResult? Function(Ready value)? ready,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LinkPending value)? linkPending,
    TResult Function(Ready value)? ready,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements DeepLinkState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class _$$LinkPendingCopyWith<$Res> {
  factory _$$LinkPendingCopyWith(
          _$LinkPending value, $Res Function(_$LinkPending) then) =
      __$$LinkPendingCopyWithImpl<$Res>;
  @useResult
  $Res call({DeepLinkRedirect link});
}

/// @nodoc
class __$$LinkPendingCopyWithImpl<$Res>
    extends _$DeepLinkStateCopyWithImpl<$Res, _$LinkPending>
    implements _$$LinkPendingCopyWith<$Res> {
  __$$LinkPendingCopyWithImpl(
      _$LinkPending _value, $Res Function(_$LinkPending) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
  }) {
    return _then(_$LinkPending(
      null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as DeepLinkRedirect,
    ));
  }
}

/// @nodoc

class _$LinkPending implements LinkPending {
  const _$LinkPending(this.link);

  @override
  final DeepLinkRedirect link;

  @override
  String toString() {
    return 'DeepLinkState.linkPending(link: $link)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkPending &&
            (identical(other.link, link) || other.link == link));
  }

  @override
  int get hashCode => Object.hash(runtimeType, link);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkPendingCopyWith<_$LinkPending> get copyWith =>
      __$$LinkPendingCopyWithImpl<_$LinkPending>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DeepLinkRedirect link) linkPending,
    required TResult Function() ready,
  }) {
    return linkPending(link);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DeepLinkRedirect link)? linkPending,
    TResult? Function()? ready,
  }) {
    return linkPending?.call(link);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DeepLinkRedirect link)? linkPending,
    TResult Function()? ready,
    required TResult orElse(),
  }) {
    if (linkPending != null) {
      return linkPending(link);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LinkPending value) linkPending,
    required TResult Function(Ready value) ready,
  }) {
    return linkPending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LinkPending value)? linkPending,
    TResult? Function(Ready value)? ready,
  }) {
    return linkPending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LinkPending value)? linkPending,
    TResult Function(Ready value)? ready,
    required TResult orElse(),
  }) {
    if (linkPending != null) {
      return linkPending(this);
    }
    return orElse();
  }
}

abstract class LinkPending implements DeepLinkState {
  const factory LinkPending(final DeepLinkRedirect link) = _$LinkPending;

  DeepLinkRedirect get link;
  @JsonKey(ignore: true)
  _$$LinkPendingCopyWith<_$LinkPending> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReadyCopyWith<$Res> {
  factory _$$ReadyCopyWith(_$Ready value, $Res Function(_$Ready) then) =
      __$$ReadyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReadyCopyWithImpl<$Res>
    extends _$DeepLinkStateCopyWithImpl<$Res, _$Ready>
    implements _$$ReadyCopyWith<$Res> {
  __$$ReadyCopyWithImpl(_$Ready _value, $Res Function(_$Ready) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Ready implements Ready {
  const _$Ready();

  @override
  String toString() {
    return 'DeepLinkState.ready()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Ready);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(DeepLinkRedirect link) linkPending,
    required TResult Function() ready,
  }) {
    return ready();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(DeepLinkRedirect link)? linkPending,
    TResult? Function()? ready,
  }) {
    return ready?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(DeepLinkRedirect link)? linkPending,
    TResult Function()? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(LinkPending value) linkPending,
    required TResult Function(Ready value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(LinkPending value)? linkPending,
    TResult? Function(Ready value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(LinkPending value)? linkPending,
    TResult Function(Ready value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class Ready implements DeepLinkState {
  const factory Ready() = _$Ready;
}
