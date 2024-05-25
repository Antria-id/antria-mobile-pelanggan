// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_pelanggan_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdatePelangganEvent {
  UpdatePelangganRequestModel get requestUser =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UpdatePelangganRequestModel requestUser)
        onUpdateTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UpdatePelangganRequestModel requestUser)? onUpdateTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UpdatePelangganRequestModel requestUser)? onUpdateTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePelangganFetchDataEvent value)
        onUpdateTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePelangganFetchDataEvent value)? onUpdateTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePelangganFetchDataEvent value)? onUpdateTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdatePelangganEventCopyWith<UpdatePelangganEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePelangganEventCopyWith<$Res> {
  factory $UpdatePelangganEventCopyWith(UpdatePelangganEvent value,
          $Res Function(UpdatePelangganEvent) then) =
      _$UpdatePelangganEventCopyWithImpl<$Res, UpdatePelangganEvent>;
  @useResult
  $Res call({UpdatePelangganRequestModel requestUser});
}

/// @nodoc
class _$UpdatePelangganEventCopyWithImpl<$Res,
        $Val extends UpdatePelangganEvent>
    implements $UpdatePelangganEventCopyWith<$Res> {
  _$UpdatePelangganEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestUser = null,
  }) {
    return _then(_value.copyWith(
      requestUser: null == requestUser
          ? _value.requestUser
          : requestUser // ignore: cast_nullable_to_non_nullable
              as UpdatePelangganRequestModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdatePelangganFetchDataEventImplCopyWith<$Res>
    implements $UpdatePelangganEventCopyWith<$Res> {
  factory _$$UpdatePelangganFetchDataEventImplCopyWith(
          _$UpdatePelangganFetchDataEventImpl value,
          $Res Function(_$UpdatePelangganFetchDataEventImpl) then) =
      __$$UpdatePelangganFetchDataEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UpdatePelangganRequestModel requestUser});
}

/// @nodoc
class __$$UpdatePelangganFetchDataEventImplCopyWithImpl<$Res>
    extends _$UpdatePelangganEventCopyWithImpl<$Res,
        _$UpdatePelangganFetchDataEventImpl>
    implements _$$UpdatePelangganFetchDataEventImplCopyWith<$Res> {
  __$$UpdatePelangganFetchDataEventImplCopyWithImpl(
      _$UpdatePelangganFetchDataEventImpl _value,
      $Res Function(_$UpdatePelangganFetchDataEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestUser = null,
  }) {
    return _then(_$UpdatePelangganFetchDataEventImpl(
      requestUser: null == requestUser
          ? _value.requestUser
          : requestUser // ignore: cast_nullable_to_non_nullable
              as UpdatePelangganRequestModel,
    ));
  }
}

/// @nodoc

class _$UpdatePelangganFetchDataEventImpl
    implements UpdatePelangganFetchDataEvent {
  const _$UpdatePelangganFetchDataEventImpl({required this.requestUser});

  @override
  final UpdatePelangganRequestModel requestUser;

  @override
  String toString() {
    return 'UpdatePelangganEvent.onUpdateTapped(requestUser: $requestUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePelangganFetchDataEventImpl &&
            (identical(other.requestUser, requestUser) ||
                other.requestUser == requestUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePelangganFetchDataEventImplCopyWith<
          _$UpdatePelangganFetchDataEventImpl>
      get copyWith => __$$UpdatePelangganFetchDataEventImplCopyWithImpl<
          _$UpdatePelangganFetchDataEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(UpdatePelangganRequestModel requestUser)
        onUpdateTapped,
  }) {
    return onUpdateTapped(requestUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(UpdatePelangganRequestModel requestUser)? onUpdateTapped,
  }) {
    return onUpdateTapped?.call(requestUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(UpdatePelangganRequestModel requestUser)? onUpdateTapped,
    required TResult orElse(),
  }) {
    if (onUpdateTapped != null) {
      return onUpdateTapped(requestUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePelangganFetchDataEvent value)
        onUpdateTapped,
  }) {
    return onUpdateTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePelangganFetchDataEvent value)? onUpdateTapped,
  }) {
    return onUpdateTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePelangganFetchDataEvent value)? onUpdateTapped,
    required TResult orElse(),
  }) {
    if (onUpdateTapped != null) {
      return onUpdateTapped(this);
    }
    return orElse();
  }
}

abstract class UpdatePelangganFetchDataEvent implements UpdatePelangganEvent {
  const factory UpdatePelangganFetchDataEvent(
          {required final UpdatePelangganRequestModel requestUser}) =
      _$UpdatePelangganFetchDataEventImpl;

  @override
  UpdatePelangganRequestModel get requestUser;
  @override
  @JsonKey(ignore: true)
  _$$UpdatePelangganFetchDataEventImplCopyWith<
          _$UpdatePelangganFetchDataEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdatePelangganState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UpdatePelangganRequestModel requestUser) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePelangganRequestModel requestUser)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePelangganRequestModel requestUser)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePelangganInitialState value) initial,
    required TResult Function(UpdatePelangganLoadingState value) loading,
    required TResult Function(UpdatePelangganErrorState value) error,
    required TResult Function(UpdatePelangganLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePelangganInitialState value)? initial,
    TResult? Function(UpdatePelangganLoadingState value)? loading,
    TResult? Function(UpdatePelangganErrorState value)? error,
    TResult? Function(UpdatePelangganLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePelangganInitialState value)? initial,
    TResult Function(UpdatePelangganLoadingState value)? loading,
    TResult Function(UpdatePelangganErrorState value)? error,
    TResult Function(UpdatePelangganLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdatePelangganStateCopyWith<$Res> {
  factory $UpdatePelangganStateCopyWith(UpdatePelangganState value,
          $Res Function(UpdatePelangganState) then) =
      _$UpdatePelangganStateCopyWithImpl<$Res, UpdatePelangganState>;
}

/// @nodoc
class _$UpdatePelangganStateCopyWithImpl<$Res,
        $Val extends UpdatePelangganState>
    implements $UpdatePelangganStateCopyWith<$Res> {
  _$UpdatePelangganStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdatePelangganInitialStateImplCopyWith<$Res> {
  factory _$$UpdatePelangganInitialStateImplCopyWith(
          _$UpdatePelangganInitialStateImpl value,
          $Res Function(_$UpdatePelangganInitialStateImpl) then) =
      __$$UpdatePelangganInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatePelangganInitialStateImplCopyWithImpl<$Res>
    extends _$UpdatePelangganStateCopyWithImpl<$Res,
        _$UpdatePelangganInitialStateImpl>
    implements _$$UpdatePelangganInitialStateImplCopyWith<$Res> {
  __$$UpdatePelangganInitialStateImplCopyWithImpl(
      _$UpdatePelangganInitialStateImpl _value,
      $Res Function(_$UpdatePelangganInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdatePelangganInitialStateImpl implements UpdatePelangganInitialState {
  const _$UpdatePelangganInitialStateImpl();

  @override
  String toString() {
    return 'UpdatePelangganState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePelangganInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UpdatePelangganRequestModel requestUser) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePelangganRequestModel requestUser)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePelangganRequestModel requestUser)? loaded,
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
    required TResult Function(UpdatePelangganInitialState value) initial,
    required TResult Function(UpdatePelangganLoadingState value) loading,
    required TResult Function(UpdatePelangganErrorState value) error,
    required TResult Function(UpdatePelangganLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePelangganInitialState value)? initial,
    TResult? Function(UpdatePelangganLoadingState value)? loading,
    TResult? Function(UpdatePelangganErrorState value)? error,
    TResult? Function(UpdatePelangganLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePelangganInitialState value)? initial,
    TResult Function(UpdatePelangganLoadingState value)? loading,
    TResult Function(UpdatePelangganErrorState value)? error,
    TResult Function(UpdatePelangganLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UpdatePelangganInitialState implements UpdatePelangganState {
  const factory UpdatePelangganInitialState() =
      _$UpdatePelangganInitialStateImpl;
}

/// @nodoc
abstract class _$$UpdatePelangganLoadingStateImplCopyWith<$Res> {
  factory _$$UpdatePelangganLoadingStateImplCopyWith(
          _$UpdatePelangganLoadingStateImpl value,
          $Res Function(_$UpdatePelangganLoadingStateImpl) then) =
      __$$UpdatePelangganLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UpdatePelangganLoadingStateImplCopyWithImpl<$Res>
    extends _$UpdatePelangganStateCopyWithImpl<$Res,
        _$UpdatePelangganLoadingStateImpl>
    implements _$$UpdatePelangganLoadingStateImplCopyWith<$Res> {
  __$$UpdatePelangganLoadingStateImplCopyWithImpl(
      _$UpdatePelangganLoadingStateImpl _value,
      $Res Function(_$UpdatePelangganLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UpdatePelangganLoadingStateImpl implements UpdatePelangganLoadingState {
  const _$UpdatePelangganLoadingStateImpl();

  @override
  String toString() {
    return 'UpdatePelangganState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePelangganLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UpdatePelangganRequestModel requestUser) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePelangganRequestModel requestUser)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePelangganRequestModel requestUser)? loaded,
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
    required TResult Function(UpdatePelangganInitialState value) initial,
    required TResult Function(UpdatePelangganLoadingState value) loading,
    required TResult Function(UpdatePelangganErrorState value) error,
    required TResult Function(UpdatePelangganLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePelangganInitialState value)? initial,
    TResult? Function(UpdatePelangganLoadingState value)? loading,
    TResult? Function(UpdatePelangganErrorState value)? error,
    TResult? Function(UpdatePelangganLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePelangganInitialState value)? initial,
    TResult Function(UpdatePelangganLoadingState value)? loading,
    TResult Function(UpdatePelangganErrorState value)? error,
    TResult Function(UpdatePelangganLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UpdatePelangganLoadingState implements UpdatePelangganState {
  const factory UpdatePelangganLoadingState() =
      _$UpdatePelangganLoadingStateImpl;
}

/// @nodoc
abstract class _$$UpdatePelangganErrorStateImplCopyWith<$Res> {
  factory _$$UpdatePelangganErrorStateImplCopyWith(
          _$UpdatePelangganErrorStateImpl value,
          $Res Function(_$UpdatePelangganErrorStateImpl) then) =
      __$$UpdatePelangganErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UpdatePelangganErrorStateImplCopyWithImpl<$Res>
    extends _$UpdatePelangganStateCopyWithImpl<$Res,
        _$UpdatePelangganErrorStateImpl>
    implements _$$UpdatePelangganErrorStateImplCopyWith<$Res> {
  __$$UpdatePelangganErrorStateImplCopyWithImpl(
      _$UpdatePelangganErrorStateImpl _value,
      $Res Function(_$UpdatePelangganErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UpdatePelangganErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePelangganErrorStateImpl implements UpdatePelangganErrorState {
  const _$UpdatePelangganErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UpdatePelangganState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePelangganErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePelangganErrorStateImplCopyWith<_$UpdatePelangganErrorStateImpl>
      get copyWith => __$$UpdatePelangganErrorStateImplCopyWithImpl<
          _$UpdatePelangganErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UpdatePelangganRequestModel requestUser) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePelangganRequestModel requestUser)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePelangganRequestModel requestUser)? loaded,
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
    required TResult Function(UpdatePelangganInitialState value) initial,
    required TResult Function(UpdatePelangganLoadingState value) loading,
    required TResult Function(UpdatePelangganErrorState value) error,
    required TResult Function(UpdatePelangganLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePelangganInitialState value)? initial,
    TResult? Function(UpdatePelangganLoadingState value)? loading,
    TResult? Function(UpdatePelangganErrorState value)? error,
    TResult? Function(UpdatePelangganLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePelangganInitialState value)? initial,
    TResult Function(UpdatePelangganLoadingState value)? loading,
    TResult Function(UpdatePelangganErrorState value)? error,
    TResult Function(UpdatePelangganLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UpdatePelangganErrorState implements UpdatePelangganState {
  const factory UpdatePelangganErrorState(final String message) =
      _$UpdatePelangganErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$UpdatePelangganErrorStateImplCopyWith<_$UpdatePelangganErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePelangganLoadedStateImplCopyWith<$Res> {
  factory _$$UpdatePelangganLoadedStateImplCopyWith(
          _$UpdatePelangganLoadedStateImpl value,
          $Res Function(_$UpdatePelangganLoadedStateImpl) then) =
      __$$UpdatePelangganLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UpdatePelangganRequestModel requestUser});
}

/// @nodoc
class __$$UpdatePelangganLoadedStateImplCopyWithImpl<$Res>
    extends _$UpdatePelangganStateCopyWithImpl<$Res,
        _$UpdatePelangganLoadedStateImpl>
    implements _$$UpdatePelangganLoadedStateImplCopyWith<$Res> {
  __$$UpdatePelangganLoadedStateImplCopyWithImpl(
      _$UpdatePelangganLoadedStateImpl _value,
      $Res Function(_$UpdatePelangganLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestUser = null,
  }) {
    return _then(_$UpdatePelangganLoadedStateImpl(
      requestUser: null == requestUser
          ? _value.requestUser
          : requestUser // ignore: cast_nullable_to_non_nullable
              as UpdatePelangganRequestModel,
    ));
  }
}

/// @nodoc

class _$UpdatePelangganLoadedStateImpl implements UpdatePelangganLoadedState {
  const _$UpdatePelangganLoadedStateImpl({required this.requestUser});

  @override
  final UpdatePelangganRequestModel requestUser;

  @override
  String toString() {
    return 'UpdatePelangganState.loaded(requestUser: $requestUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePelangganLoadedStateImpl &&
            (identical(other.requestUser, requestUser) ||
                other.requestUser == requestUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requestUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePelangganLoadedStateImplCopyWith<_$UpdatePelangganLoadedStateImpl>
      get copyWith => __$$UpdatePelangganLoadedStateImplCopyWithImpl<
          _$UpdatePelangganLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UpdatePelangganRequestModel requestUser) loaded,
  }) {
    return loaded(requestUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UpdatePelangganRequestModel requestUser)? loaded,
  }) {
    return loaded?.call(requestUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UpdatePelangganRequestModel requestUser)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(requestUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdatePelangganInitialState value) initial,
    required TResult Function(UpdatePelangganLoadingState value) loading,
    required TResult Function(UpdatePelangganErrorState value) error,
    required TResult Function(UpdatePelangganLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdatePelangganInitialState value)? initial,
    TResult? Function(UpdatePelangganLoadingState value)? loading,
    TResult? Function(UpdatePelangganErrorState value)? error,
    TResult? Function(UpdatePelangganLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdatePelangganInitialState value)? initial,
    TResult Function(UpdatePelangganLoadingState value)? loading,
    TResult Function(UpdatePelangganErrorState value)? error,
    TResult Function(UpdatePelangganLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UpdatePelangganLoadedState implements UpdatePelangganState {
  const factory UpdatePelangganLoadedState(
          {required final UpdatePelangganRequestModel requestUser}) =
      _$UpdatePelangganLoadedStateImpl;

  UpdatePelangganRequestModel get requestUser;
  @JsonKey(ignore: true)
  _$$UpdatePelangganLoadedStateImplCopyWith<_$UpdatePelangganLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
