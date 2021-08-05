// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'newspress_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewspressStateTearOff {
  const _$NewspressStateTearOff();

  _NewspressData data({required List<Article> news}) {
    return _NewspressData(
      news: news,
    );
  }

  _NewspressInitial initial() {
    return const _NewspressInitial();
  }

  _NewspressLoading loading() {
    return const _NewspressLoading();
  }

  _NewspressError error([String? message]) {
    return _NewspressError(
      message,
    );
  }
}

/// @nodoc
const $NewspressState = _$NewspressStateTearOff();

/// @nodoc
mixin _$NewspressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Article> news) data,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Article> news)? data,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewspressData value) data,
    required TResult Function(_NewspressInitial value) initial,
    required TResult Function(_NewspressLoading value) loading,
    required TResult Function(_NewspressError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewspressData value)? data,
    TResult Function(_NewspressInitial value)? initial,
    TResult Function(_NewspressLoading value)? loading,
    TResult Function(_NewspressError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewspressStateCopyWith<$Res> {
  factory $NewspressStateCopyWith(
          NewspressState value, $Res Function(NewspressState) then) =
      _$NewspressStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewspressStateCopyWithImpl<$Res>
    implements $NewspressStateCopyWith<$Res> {
  _$NewspressStateCopyWithImpl(this._value, this._then);

  final NewspressState _value;
  // ignore: unused_field
  final $Res Function(NewspressState) _then;
}

/// @nodoc
abstract class _$NewspressDataCopyWith<$Res> {
  factory _$NewspressDataCopyWith(
          _NewspressData value, $Res Function(_NewspressData) then) =
      __$NewspressDataCopyWithImpl<$Res>;
  $Res call({List<Article> news});
}

/// @nodoc
class __$NewspressDataCopyWithImpl<$Res>
    extends _$NewspressStateCopyWithImpl<$Res>
    implements _$NewspressDataCopyWith<$Res> {
  __$NewspressDataCopyWithImpl(
      _NewspressData _value, $Res Function(_NewspressData) _then)
      : super(_value, (v) => _then(v as _NewspressData));

  @override
  _NewspressData get _value => super._value as _NewspressData;

  @override
  $Res call({
    Object? news = freezed,
  }) {
    return _then(_NewspressData(
      news: news == freezed
          ? _value.news
          : news // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc

class _$_NewspressData implements _NewspressData {
  const _$_NewspressData({required this.news});

  @override
  final List<Article> news;

  @override
  String toString() {
    return 'NewspressState.data(news: $news)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewspressData &&
            (identical(other.news, news) ||
                const DeepCollectionEquality().equals(other.news, news)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(news);

  @JsonKey(ignore: true)
  @override
  _$NewspressDataCopyWith<_NewspressData> get copyWith =>
      __$NewspressDataCopyWithImpl<_NewspressData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Article> news) data,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return data(news);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Article> news)? data,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(news);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NewspressData value) data,
    required TResult Function(_NewspressInitial value) initial,
    required TResult Function(_NewspressLoading value) loading,
    required TResult Function(_NewspressError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewspressData value)? data,
    TResult Function(_NewspressInitial value)? initial,
    TResult Function(_NewspressLoading value)? loading,
    TResult Function(_NewspressError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _NewspressData implements NewspressState {
  const factory _NewspressData({required List<Article> news}) =
      _$_NewspressData;

  List<Article> get news => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$NewspressDataCopyWith<_NewspressData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NewspressInitialCopyWith<$Res> {
  factory _$NewspressInitialCopyWith(
          _NewspressInitial value, $Res Function(_NewspressInitial) then) =
      __$NewspressInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$NewspressInitialCopyWithImpl<$Res>
    extends _$NewspressStateCopyWithImpl<$Res>
    implements _$NewspressInitialCopyWith<$Res> {
  __$NewspressInitialCopyWithImpl(
      _NewspressInitial _value, $Res Function(_NewspressInitial) _then)
      : super(_value, (v) => _then(v as _NewspressInitial));

  @override
  _NewspressInitial get _value => super._value as _NewspressInitial;
}

/// @nodoc

class _$_NewspressInitial implements _NewspressInitial {
  const _$_NewspressInitial();

  @override
  String toString() {
    return 'NewspressState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NewspressInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Article> news) data,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Article> news)? data,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String? message)? error,
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
    required TResult Function(_NewspressData value) data,
    required TResult Function(_NewspressInitial value) initial,
    required TResult Function(_NewspressLoading value) loading,
    required TResult Function(_NewspressError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewspressData value)? data,
    TResult Function(_NewspressInitial value)? initial,
    TResult Function(_NewspressLoading value)? loading,
    TResult Function(_NewspressError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _NewspressInitial implements NewspressState {
  const factory _NewspressInitial() = _$_NewspressInitial;
}

/// @nodoc
abstract class _$NewspressLoadingCopyWith<$Res> {
  factory _$NewspressLoadingCopyWith(
          _NewspressLoading value, $Res Function(_NewspressLoading) then) =
      __$NewspressLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$NewspressLoadingCopyWithImpl<$Res>
    extends _$NewspressStateCopyWithImpl<$Res>
    implements _$NewspressLoadingCopyWith<$Res> {
  __$NewspressLoadingCopyWithImpl(
      _NewspressLoading _value, $Res Function(_NewspressLoading) _then)
      : super(_value, (v) => _then(v as _NewspressLoading));

  @override
  _NewspressLoading get _value => super._value as _NewspressLoading;
}

/// @nodoc

class _$_NewspressLoading implements _NewspressLoading {
  const _$_NewspressLoading();

  @override
  String toString() {
    return 'NewspressState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NewspressLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Article> news) data,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Article> news)? data,
    TResult Function()? initial,
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
  TResult map<TResult extends Object?>({
    required TResult Function(_NewspressData value) data,
    required TResult Function(_NewspressInitial value) initial,
    required TResult Function(_NewspressLoading value) loading,
    required TResult Function(_NewspressError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewspressData value)? data,
    TResult Function(_NewspressInitial value)? initial,
    TResult Function(_NewspressLoading value)? loading,
    TResult Function(_NewspressError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _NewspressLoading implements NewspressState {
  const factory _NewspressLoading() = _$_NewspressLoading;
}

/// @nodoc
abstract class _$NewspressErrorCopyWith<$Res> {
  factory _$NewspressErrorCopyWith(
          _NewspressError value, $Res Function(_NewspressError) then) =
      __$NewspressErrorCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$NewspressErrorCopyWithImpl<$Res>
    extends _$NewspressStateCopyWithImpl<$Res>
    implements _$NewspressErrorCopyWith<$Res> {
  __$NewspressErrorCopyWithImpl(
      _NewspressError _value, $Res Function(_NewspressError) _then)
      : super(_value, (v) => _then(v as _NewspressError));

  @override
  _NewspressError get _value => super._value as _NewspressError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_NewspressError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_NewspressError implements _NewspressError {
  const _$_NewspressError([this.message]);

  @override
  final String? message;

  @override
  String toString() {
    return 'NewspressState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NewspressError &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$NewspressErrorCopyWith<_NewspressError> get copyWith =>
      __$NewspressErrorCopyWithImpl<_NewspressError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Article> news) data,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String? message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Article> news)? data,
    TResult Function()? initial,
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
  TResult map<TResult extends Object?>({
    required TResult Function(_NewspressData value) data,
    required TResult Function(_NewspressInitial value) initial,
    required TResult Function(_NewspressLoading value) loading,
    required TResult Function(_NewspressError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NewspressData value)? data,
    TResult Function(_NewspressInitial value)? initial,
    TResult Function(_NewspressLoading value)? loading,
    TResult Function(_NewspressError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _NewspressError implements NewspressState {
  const factory _NewspressError([String? message]) = _$_NewspressError;

  String? get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$NewspressErrorCopyWith<_NewspressError> get copyWith =>
      throw _privateConstructorUsedError;
}
