// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_restaurant_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InfoRestaurantEvent {
  int get mitraId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int mitraId) ongetInfoRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int mitraId)? ongetInfoRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int mitraId)? ongetInfoRestaurant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InfoRestaurantUserEvent value)
        ongetInfoRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InfoRestaurantUserEvent value)? ongetInfoRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InfoRestaurantUserEvent value)? ongetInfoRestaurant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InfoRestaurantEventCopyWith<InfoRestaurantEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoRestaurantEventCopyWith<$Res> {
  factory $InfoRestaurantEventCopyWith(
          InfoRestaurantEvent value, $Res Function(InfoRestaurantEvent) then) =
      _$InfoRestaurantEventCopyWithImpl<$Res, InfoRestaurantEvent>;
  @useResult
  $Res call({int mitraId});
}

/// @nodoc
class _$InfoRestaurantEventCopyWithImpl<$Res, $Val extends InfoRestaurantEvent>
    implements $InfoRestaurantEventCopyWith<$Res> {
  _$InfoRestaurantEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mitraId = null,
  }) {
    return _then(_value.copyWith(
      mitraId: null == mitraId
          ? _value.mitraId
          : mitraId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InfoRestaurantUserEventImplCopyWith<$Res>
    implements $InfoRestaurantEventCopyWith<$Res> {
  factory _$$InfoRestaurantUserEventImplCopyWith(
          _$InfoRestaurantUserEventImpl value,
          $Res Function(_$InfoRestaurantUserEventImpl) then) =
      __$$InfoRestaurantUserEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int mitraId});
}

/// @nodoc
class __$$InfoRestaurantUserEventImplCopyWithImpl<$Res>
    extends _$InfoRestaurantEventCopyWithImpl<$Res,
        _$InfoRestaurantUserEventImpl>
    implements _$$InfoRestaurantUserEventImplCopyWith<$Res> {
  __$$InfoRestaurantUserEventImplCopyWithImpl(
      _$InfoRestaurantUserEventImpl _value,
      $Res Function(_$InfoRestaurantUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mitraId = null,
  }) {
    return _then(_$InfoRestaurantUserEventImpl(
      mitraId: null == mitraId
          ? _value.mitraId
          : mitraId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InfoRestaurantUserEventImpl implements InfoRestaurantUserEvent {
  const _$InfoRestaurantUserEventImpl({required this.mitraId});

  @override
  final int mitraId;

  @override
  String toString() {
    return 'InfoRestaurantEvent.ongetInfoRestaurant(mitraId: $mitraId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoRestaurantUserEventImpl &&
            (identical(other.mitraId, mitraId) || other.mitraId == mitraId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mitraId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoRestaurantUserEventImplCopyWith<_$InfoRestaurantUserEventImpl>
      get copyWith => __$$InfoRestaurantUserEventImplCopyWithImpl<
          _$InfoRestaurantUserEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int mitraId) ongetInfoRestaurant,
  }) {
    return ongetInfoRestaurant(mitraId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int mitraId)? ongetInfoRestaurant,
  }) {
    return ongetInfoRestaurant?.call(mitraId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int mitraId)? ongetInfoRestaurant,
    required TResult orElse(),
  }) {
    if (ongetInfoRestaurant != null) {
      return ongetInfoRestaurant(mitraId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InfoRestaurantUserEvent value)
        ongetInfoRestaurant,
  }) {
    return ongetInfoRestaurant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InfoRestaurantUserEvent value)? ongetInfoRestaurant,
  }) {
    return ongetInfoRestaurant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InfoRestaurantUserEvent value)? ongetInfoRestaurant,
    required TResult orElse(),
  }) {
    if (ongetInfoRestaurant != null) {
      return ongetInfoRestaurant(this);
    }
    return orElse();
  }
}

abstract class InfoRestaurantUserEvent implements InfoRestaurantEvent {
  const factory InfoRestaurantUserEvent({required final int mitraId}) =
      _$InfoRestaurantUserEventImpl;

  @override
  int get mitraId;
  @override
  @JsonKey(ignore: true)
  _$$InfoRestaurantUserEventImplCopyWith<_$InfoRestaurantUserEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InfoRestaurantState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GetInfoRestaurantResponse response) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GetInfoRestaurantResponse response)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GetInfoRestaurantResponse response)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InfoRestaurantInitialState value) initial,
    required TResult Function(InfoRestaurantLoadingState value) loading,
    required TResult Function(InfoRestaurantErrorState value) error,
    required TResult Function(InfoRestaurantLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InfoRestaurantInitialState value)? initial,
    TResult? Function(InfoRestaurantLoadingState value)? loading,
    TResult? Function(InfoRestaurantErrorState value)? error,
    TResult? Function(InfoRestaurantLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InfoRestaurantInitialState value)? initial,
    TResult Function(InfoRestaurantLoadingState value)? loading,
    TResult Function(InfoRestaurantErrorState value)? error,
    TResult Function(InfoRestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InfoRestaurantStateCopyWith<$Res> {
  factory $InfoRestaurantStateCopyWith(
          InfoRestaurantState value, $Res Function(InfoRestaurantState) then) =
      _$InfoRestaurantStateCopyWithImpl<$Res, InfoRestaurantState>;
}

/// @nodoc
class _$InfoRestaurantStateCopyWithImpl<$Res, $Val extends InfoRestaurantState>
    implements $InfoRestaurantStateCopyWith<$Res> {
  _$InfoRestaurantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InfoRestaurantInitialStateImplCopyWith<$Res> {
  factory _$$InfoRestaurantInitialStateImplCopyWith(
          _$InfoRestaurantInitialStateImpl value,
          $Res Function(_$InfoRestaurantInitialStateImpl) then) =
      __$$InfoRestaurantInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InfoRestaurantInitialStateImplCopyWithImpl<$Res>
    extends _$InfoRestaurantStateCopyWithImpl<$Res,
        _$InfoRestaurantInitialStateImpl>
    implements _$$InfoRestaurantInitialStateImplCopyWith<$Res> {
  __$$InfoRestaurantInitialStateImplCopyWithImpl(
      _$InfoRestaurantInitialStateImpl _value,
      $Res Function(_$InfoRestaurantInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InfoRestaurantInitialStateImpl implements InfoRestaurantInitialState {
  const _$InfoRestaurantInitialStateImpl();

  @override
  String toString() {
    return 'InfoRestaurantState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoRestaurantInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GetInfoRestaurantResponse response) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GetInfoRestaurantResponse response)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GetInfoRestaurantResponse response)? loaded,
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
    required TResult Function(InfoRestaurantInitialState value) initial,
    required TResult Function(InfoRestaurantLoadingState value) loading,
    required TResult Function(InfoRestaurantErrorState value) error,
    required TResult Function(InfoRestaurantLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InfoRestaurantInitialState value)? initial,
    TResult? Function(InfoRestaurantLoadingState value)? loading,
    TResult? Function(InfoRestaurantErrorState value)? error,
    TResult? Function(InfoRestaurantLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InfoRestaurantInitialState value)? initial,
    TResult Function(InfoRestaurantLoadingState value)? loading,
    TResult Function(InfoRestaurantErrorState value)? error,
    TResult Function(InfoRestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class InfoRestaurantInitialState implements InfoRestaurantState {
  const factory InfoRestaurantInitialState() = _$InfoRestaurantInitialStateImpl;
}

/// @nodoc
abstract class _$$InfoRestaurantLoadingStateImplCopyWith<$Res> {
  factory _$$InfoRestaurantLoadingStateImplCopyWith(
          _$InfoRestaurantLoadingStateImpl value,
          $Res Function(_$InfoRestaurantLoadingStateImpl) then) =
      __$$InfoRestaurantLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InfoRestaurantLoadingStateImplCopyWithImpl<$Res>
    extends _$InfoRestaurantStateCopyWithImpl<$Res,
        _$InfoRestaurantLoadingStateImpl>
    implements _$$InfoRestaurantLoadingStateImplCopyWith<$Res> {
  __$$InfoRestaurantLoadingStateImplCopyWithImpl(
      _$InfoRestaurantLoadingStateImpl _value,
      $Res Function(_$InfoRestaurantLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InfoRestaurantLoadingStateImpl implements InfoRestaurantLoadingState {
  const _$InfoRestaurantLoadingStateImpl();

  @override
  String toString() {
    return 'InfoRestaurantState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoRestaurantLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GetInfoRestaurantResponse response) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GetInfoRestaurantResponse response)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GetInfoRestaurantResponse response)? loaded,
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
    required TResult Function(InfoRestaurantInitialState value) initial,
    required TResult Function(InfoRestaurantLoadingState value) loading,
    required TResult Function(InfoRestaurantErrorState value) error,
    required TResult Function(InfoRestaurantLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InfoRestaurantInitialState value)? initial,
    TResult? Function(InfoRestaurantLoadingState value)? loading,
    TResult? Function(InfoRestaurantErrorState value)? error,
    TResult? Function(InfoRestaurantLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InfoRestaurantInitialState value)? initial,
    TResult Function(InfoRestaurantLoadingState value)? loading,
    TResult Function(InfoRestaurantErrorState value)? error,
    TResult Function(InfoRestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class InfoRestaurantLoadingState implements InfoRestaurantState {
  const factory InfoRestaurantLoadingState() = _$InfoRestaurantLoadingStateImpl;
}

/// @nodoc
abstract class _$$InfoRestaurantErrorStateImplCopyWith<$Res> {
  factory _$$InfoRestaurantErrorStateImplCopyWith(
          _$InfoRestaurantErrorStateImpl value,
          $Res Function(_$InfoRestaurantErrorStateImpl) then) =
      __$$InfoRestaurantErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InfoRestaurantErrorStateImplCopyWithImpl<$Res>
    extends _$InfoRestaurantStateCopyWithImpl<$Res,
        _$InfoRestaurantErrorStateImpl>
    implements _$$InfoRestaurantErrorStateImplCopyWith<$Res> {
  __$$InfoRestaurantErrorStateImplCopyWithImpl(
      _$InfoRestaurantErrorStateImpl _value,
      $Res Function(_$InfoRestaurantErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InfoRestaurantErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InfoRestaurantErrorStateImpl implements InfoRestaurantErrorState {
  const _$InfoRestaurantErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'InfoRestaurantState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoRestaurantErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoRestaurantErrorStateImplCopyWith<_$InfoRestaurantErrorStateImpl>
      get copyWith => __$$InfoRestaurantErrorStateImplCopyWithImpl<
          _$InfoRestaurantErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GetInfoRestaurantResponse response) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GetInfoRestaurantResponse response)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GetInfoRestaurantResponse response)? loaded,
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
    required TResult Function(InfoRestaurantInitialState value) initial,
    required TResult Function(InfoRestaurantLoadingState value) loading,
    required TResult Function(InfoRestaurantErrorState value) error,
    required TResult Function(InfoRestaurantLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InfoRestaurantInitialState value)? initial,
    TResult? Function(InfoRestaurantLoadingState value)? loading,
    TResult? Function(InfoRestaurantErrorState value)? error,
    TResult? Function(InfoRestaurantLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InfoRestaurantInitialState value)? initial,
    TResult Function(InfoRestaurantLoadingState value)? loading,
    TResult Function(InfoRestaurantErrorState value)? error,
    TResult Function(InfoRestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class InfoRestaurantErrorState implements InfoRestaurantState {
  const factory InfoRestaurantErrorState(final String message) =
      _$InfoRestaurantErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$InfoRestaurantErrorStateImplCopyWith<_$InfoRestaurantErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InfoRestaurantLoadedStateImplCopyWith<$Res> {
  factory _$$InfoRestaurantLoadedStateImplCopyWith(
          _$InfoRestaurantLoadedStateImpl value,
          $Res Function(_$InfoRestaurantLoadedStateImpl) then) =
      __$$InfoRestaurantLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetInfoRestaurantResponse response});
}

/// @nodoc
class __$$InfoRestaurantLoadedStateImplCopyWithImpl<$Res>
    extends _$InfoRestaurantStateCopyWithImpl<$Res,
        _$InfoRestaurantLoadedStateImpl>
    implements _$$InfoRestaurantLoadedStateImplCopyWith<$Res> {
  __$$InfoRestaurantLoadedStateImplCopyWithImpl(
      _$InfoRestaurantLoadedStateImpl _value,
      $Res Function(_$InfoRestaurantLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$InfoRestaurantLoadedStateImpl(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as GetInfoRestaurantResponse,
    ));
  }
}

/// @nodoc

class _$InfoRestaurantLoadedStateImpl implements InfoRestaurantLoadedState {
  const _$InfoRestaurantLoadedStateImpl({required this.response});

  @override
  final GetInfoRestaurantResponse response;

  @override
  String toString() {
    return 'InfoRestaurantState.loaded(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InfoRestaurantLoadedStateImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InfoRestaurantLoadedStateImplCopyWith<_$InfoRestaurantLoadedStateImpl>
      get copyWith => __$$InfoRestaurantLoadedStateImplCopyWithImpl<
          _$InfoRestaurantLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GetInfoRestaurantResponse response) loaded,
  }) {
    return loaded(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GetInfoRestaurantResponse response)? loaded,
  }) {
    return loaded?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GetInfoRestaurantResponse response)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InfoRestaurantInitialState value) initial,
    required TResult Function(InfoRestaurantLoadingState value) loading,
    required TResult Function(InfoRestaurantErrorState value) error,
    required TResult Function(InfoRestaurantLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InfoRestaurantInitialState value)? initial,
    TResult? Function(InfoRestaurantLoadingState value)? loading,
    TResult? Function(InfoRestaurantErrorState value)? error,
    TResult? Function(InfoRestaurantLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InfoRestaurantInitialState value)? initial,
    TResult Function(InfoRestaurantLoadingState value)? loading,
    TResult Function(InfoRestaurantErrorState value)? error,
    TResult Function(InfoRestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class InfoRestaurantLoadedState implements InfoRestaurantState {
  const factory InfoRestaurantLoadedState(
          {required final GetInfoRestaurantResponse response}) =
      _$InfoRestaurantLoadedStateImpl;

  GetInfoRestaurantResponse get response;
  @JsonKey(ignore: true)
  _$$InfoRestaurantLoadedStateImplCopyWith<_$InfoRestaurantLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
