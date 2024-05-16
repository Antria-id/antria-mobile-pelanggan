// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_restaurant_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetRestaurantEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ongetRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ongetRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ongetRestaurant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RestaurantUserEvent value) ongetRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestaurantUserEvent value)? ongetRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestaurantUserEvent value)? ongetRestaurant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRestaurantEventCopyWith<$Res> {
  factory $GetRestaurantEventCopyWith(
          GetRestaurantEvent value, $Res Function(GetRestaurantEvent) then) =
      _$GetRestaurantEventCopyWithImpl<$Res, GetRestaurantEvent>;
}

/// @nodoc
class _$GetRestaurantEventCopyWithImpl<$Res, $Val extends GetRestaurantEvent>
    implements $GetRestaurantEventCopyWith<$Res> {
  _$GetRestaurantEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RestaurantUserEventImplCopyWith<$Res> {
  factory _$$RestaurantUserEventImplCopyWith(_$RestaurantUserEventImpl value,
          $Res Function(_$RestaurantUserEventImpl) then) =
      __$$RestaurantUserEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestaurantUserEventImplCopyWithImpl<$Res>
    extends _$GetRestaurantEventCopyWithImpl<$Res, _$RestaurantUserEventImpl>
    implements _$$RestaurantUserEventImplCopyWith<$Res> {
  __$$RestaurantUserEventImplCopyWithImpl(_$RestaurantUserEventImpl _value,
      $Res Function(_$RestaurantUserEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RestaurantUserEventImpl implements RestaurantUserEvent {
  const _$RestaurantUserEventImpl();

  @override
  String toString() {
    return 'GetRestaurantEvent.ongetRestaurant()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantUserEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() ongetRestaurant,
  }) {
    return ongetRestaurant();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? ongetRestaurant,
  }) {
    return ongetRestaurant?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? ongetRestaurant,
    required TResult orElse(),
  }) {
    if (ongetRestaurant != null) {
      return ongetRestaurant();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RestaurantUserEvent value) ongetRestaurant,
  }) {
    return ongetRestaurant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestaurantUserEvent value)? ongetRestaurant,
  }) {
    return ongetRestaurant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestaurantUserEvent value)? ongetRestaurant,
    required TResult orElse(),
  }) {
    if (ongetRestaurant != null) {
      return ongetRestaurant(this);
    }
    return orElse();
  }
}

abstract class RestaurantUserEvent implements GetRestaurantEvent {
  const factory RestaurantUserEvent() = _$RestaurantUserEventImpl;
}

/// @nodoc
mixin _$GetRestaurantState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GetRestaurantResponse> response) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GetRestaurantResponse> response)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GetRestaurantResponse> response)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RestaurantInitialState value) initial,
    required TResult Function(RestaurantLoadingState value) loading,
    required TResult Function(RestaurantErrorState value) error,
    required TResult Function(RestaurantLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestaurantInitialState value)? initial,
    TResult? Function(RestaurantLoadingState value)? loading,
    TResult? Function(RestaurantErrorState value)? error,
    TResult? Function(RestaurantLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestaurantInitialState value)? initial,
    TResult Function(RestaurantLoadingState value)? loading,
    TResult Function(RestaurantErrorState value)? error,
    TResult Function(RestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRestaurantStateCopyWith<$Res> {
  factory $GetRestaurantStateCopyWith(
          GetRestaurantState value, $Res Function(GetRestaurantState) then) =
      _$GetRestaurantStateCopyWithImpl<$Res, GetRestaurantState>;
}

/// @nodoc
class _$GetRestaurantStateCopyWithImpl<$Res, $Val extends GetRestaurantState>
    implements $GetRestaurantStateCopyWith<$Res> {
  _$GetRestaurantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RestaurantInitialStateImplCopyWith<$Res> {
  factory _$$RestaurantInitialStateImplCopyWith(
          _$RestaurantInitialStateImpl value,
          $Res Function(_$RestaurantInitialStateImpl) then) =
      __$$RestaurantInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestaurantInitialStateImplCopyWithImpl<$Res>
    extends _$GetRestaurantStateCopyWithImpl<$Res, _$RestaurantInitialStateImpl>
    implements _$$RestaurantInitialStateImplCopyWith<$Res> {
  __$$RestaurantInitialStateImplCopyWithImpl(
      _$RestaurantInitialStateImpl _value,
      $Res Function(_$RestaurantInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RestaurantInitialStateImpl implements RestaurantInitialState {
  const _$RestaurantInitialStateImpl();

  @override
  String toString() {
    return 'GetRestaurantState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GetRestaurantResponse> response) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GetRestaurantResponse> response)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GetRestaurantResponse> response)? loaded,
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
    required TResult Function(RestaurantInitialState value) initial,
    required TResult Function(RestaurantLoadingState value) loading,
    required TResult Function(RestaurantErrorState value) error,
    required TResult Function(RestaurantLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestaurantInitialState value)? initial,
    TResult? Function(RestaurantLoadingState value)? loading,
    TResult? Function(RestaurantErrorState value)? error,
    TResult? Function(RestaurantLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestaurantInitialState value)? initial,
    TResult Function(RestaurantLoadingState value)? loading,
    TResult Function(RestaurantErrorState value)? error,
    TResult Function(RestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RestaurantInitialState implements GetRestaurantState {
  const factory RestaurantInitialState() = _$RestaurantInitialStateImpl;
}

/// @nodoc
abstract class _$$RestaurantLoadingStateImplCopyWith<$Res> {
  factory _$$RestaurantLoadingStateImplCopyWith(
          _$RestaurantLoadingStateImpl value,
          $Res Function(_$RestaurantLoadingStateImpl) then) =
      __$$RestaurantLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RestaurantLoadingStateImplCopyWithImpl<$Res>
    extends _$GetRestaurantStateCopyWithImpl<$Res, _$RestaurantLoadingStateImpl>
    implements _$$RestaurantLoadingStateImplCopyWith<$Res> {
  __$$RestaurantLoadingStateImplCopyWithImpl(
      _$RestaurantLoadingStateImpl _value,
      $Res Function(_$RestaurantLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RestaurantLoadingStateImpl implements RestaurantLoadingState {
  const _$RestaurantLoadingStateImpl();

  @override
  String toString() {
    return 'GetRestaurantState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GetRestaurantResponse> response) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GetRestaurantResponse> response)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GetRestaurantResponse> response)? loaded,
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
    required TResult Function(RestaurantInitialState value) initial,
    required TResult Function(RestaurantLoadingState value) loading,
    required TResult Function(RestaurantErrorState value) error,
    required TResult Function(RestaurantLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestaurantInitialState value)? initial,
    TResult? Function(RestaurantLoadingState value)? loading,
    TResult? Function(RestaurantErrorState value)? error,
    TResult? Function(RestaurantLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestaurantInitialState value)? initial,
    TResult Function(RestaurantLoadingState value)? loading,
    TResult Function(RestaurantErrorState value)? error,
    TResult Function(RestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RestaurantLoadingState implements GetRestaurantState {
  const factory RestaurantLoadingState() = _$RestaurantLoadingStateImpl;
}

/// @nodoc
abstract class _$$RestaurantErrorStateImplCopyWith<$Res> {
  factory _$$RestaurantErrorStateImplCopyWith(_$RestaurantErrorStateImpl value,
          $Res Function(_$RestaurantErrorStateImpl) then) =
      __$$RestaurantErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RestaurantErrorStateImplCopyWithImpl<$Res>
    extends _$GetRestaurantStateCopyWithImpl<$Res, _$RestaurantErrorStateImpl>
    implements _$$RestaurantErrorStateImplCopyWith<$Res> {
  __$$RestaurantErrorStateImplCopyWithImpl(_$RestaurantErrorStateImpl _value,
      $Res Function(_$RestaurantErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RestaurantErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RestaurantErrorStateImpl implements RestaurantErrorState {
  const _$RestaurantErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GetRestaurantState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantErrorStateImplCopyWith<_$RestaurantErrorStateImpl>
      get copyWith =>
          __$$RestaurantErrorStateImplCopyWithImpl<_$RestaurantErrorStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GetRestaurantResponse> response) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GetRestaurantResponse> response)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GetRestaurantResponse> response)? loaded,
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
    required TResult Function(RestaurantInitialState value) initial,
    required TResult Function(RestaurantLoadingState value) loading,
    required TResult Function(RestaurantErrorState value) error,
    required TResult Function(RestaurantLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestaurantInitialState value)? initial,
    TResult? Function(RestaurantLoadingState value)? loading,
    TResult? Function(RestaurantErrorState value)? error,
    TResult? Function(RestaurantLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestaurantInitialState value)? initial,
    TResult Function(RestaurantLoadingState value)? loading,
    TResult Function(RestaurantErrorState value)? error,
    TResult Function(RestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RestaurantErrorState implements GetRestaurantState {
  const factory RestaurantErrorState(final String message) =
      _$RestaurantErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RestaurantErrorStateImplCopyWith<_$RestaurantErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RestaurantLoadedStateImplCopyWith<$Res> {
  factory _$$RestaurantLoadedStateImplCopyWith(
          _$RestaurantLoadedStateImpl value,
          $Res Function(_$RestaurantLoadedStateImpl) then) =
      __$$RestaurantLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GetRestaurantResponse> response});
}

/// @nodoc
class __$$RestaurantLoadedStateImplCopyWithImpl<$Res>
    extends _$GetRestaurantStateCopyWithImpl<$Res, _$RestaurantLoadedStateImpl>
    implements _$$RestaurantLoadedStateImplCopyWith<$Res> {
  __$$RestaurantLoadedStateImplCopyWithImpl(_$RestaurantLoadedStateImpl _value,
      $Res Function(_$RestaurantLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$RestaurantLoadedStateImpl(
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<GetRestaurantResponse>,
    ));
  }
}

/// @nodoc

class _$RestaurantLoadedStateImpl implements RestaurantLoadedState {
  const _$RestaurantLoadedStateImpl(
      {required final List<GetRestaurantResponse> response})
      : _response = response;

  final List<GetRestaurantResponse> _response;
  @override
  List<GetRestaurantResponse> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  String toString() {
    return 'GetRestaurantState.loaded(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._response, _response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_response));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantLoadedStateImplCopyWith<_$RestaurantLoadedStateImpl>
      get copyWith => __$$RestaurantLoadedStateImplCopyWithImpl<
          _$RestaurantLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GetRestaurantResponse> response) loaded,
  }) {
    return loaded(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GetRestaurantResponse> response)? loaded,
  }) {
    return loaded?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GetRestaurantResponse> response)? loaded,
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
    required TResult Function(RestaurantInitialState value) initial,
    required TResult Function(RestaurantLoadingState value) loading,
    required TResult Function(RestaurantErrorState value) error,
    required TResult Function(RestaurantLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RestaurantInitialState value)? initial,
    TResult? Function(RestaurantLoadingState value)? loading,
    TResult? Function(RestaurantErrorState value)? error,
    TResult? Function(RestaurantLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RestaurantInitialState value)? initial,
    TResult Function(RestaurantLoadingState value)? loading,
    TResult Function(RestaurantErrorState value)? error,
    TResult Function(RestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RestaurantLoadedState implements GetRestaurantState {
  const factory RestaurantLoadedState(
          {required final List<GetRestaurantResponse> response}) =
      _$RestaurantLoadedStateImpl;

  List<GetRestaurantResponse> get response;
  @JsonKey(ignore: true)
  _$$RestaurantLoadedStateImplCopyWith<_$RestaurantLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
