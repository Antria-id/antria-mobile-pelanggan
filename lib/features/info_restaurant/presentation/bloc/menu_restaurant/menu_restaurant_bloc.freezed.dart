// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_restaurant_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MenuRestaurantEvent {
  int get mitraId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int mitraId) ongetMenuRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int mitraId)? ongetMenuRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int mitraId)? ongetMenuRestaurant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MenuRestaurantUserEvent value)
        ongetMenuRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MenuRestaurantUserEvent value)? ongetMenuRestaurant,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuRestaurantUserEvent value)? ongetMenuRestaurant,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MenuRestaurantEventCopyWith<MenuRestaurantEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuRestaurantEventCopyWith<$Res> {
  factory $MenuRestaurantEventCopyWith(
          MenuRestaurantEvent value, $Res Function(MenuRestaurantEvent) then) =
      _$MenuRestaurantEventCopyWithImpl<$Res, MenuRestaurantEvent>;
  @useResult
  $Res call({int mitraId});
}

/// @nodoc
class _$MenuRestaurantEventCopyWithImpl<$Res, $Val extends MenuRestaurantEvent>
    implements $MenuRestaurantEventCopyWith<$Res> {
  _$MenuRestaurantEventCopyWithImpl(this._value, this._then);

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
abstract class _$$MenuRestaurantUserEventImplCopyWith<$Res>
    implements $MenuRestaurantEventCopyWith<$Res> {
  factory _$$MenuRestaurantUserEventImplCopyWith(
          _$MenuRestaurantUserEventImpl value,
          $Res Function(_$MenuRestaurantUserEventImpl) then) =
      __$$MenuRestaurantUserEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int mitraId});
}

/// @nodoc
class __$$MenuRestaurantUserEventImplCopyWithImpl<$Res>
    extends _$MenuRestaurantEventCopyWithImpl<$Res,
        _$MenuRestaurantUserEventImpl>
    implements _$$MenuRestaurantUserEventImplCopyWith<$Res> {
  __$$MenuRestaurantUserEventImplCopyWithImpl(
      _$MenuRestaurantUserEventImpl _value,
      $Res Function(_$MenuRestaurantUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mitraId = null,
  }) {
    return _then(_$MenuRestaurantUserEventImpl(
      mitraId: null == mitraId
          ? _value.mitraId
          : mitraId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$MenuRestaurantUserEventImpl implements MenuRestaurantUserEvent {
  const _$MenuRestaurantUserEventImpl({required this.mitraId});

  @override
  final int mitraId;

  @override
  String toString() {
    return 'MenuRestaurantEvent.ongetMenuRestaurant(mitraId: $mitraId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuRestaurantUserEventImpl &&
            (identical(other.mitraId, mitraId) || other.mitraId == mitraId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mitraId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuRestaurantUserEventImplCopyWith<_$MenuRestaurantUserEventImpl>
      get copyWith => __$$MenuRestaurantUserEventImplCopyWithImpl<
          _$MenuRestaurantUserEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int mitraId) ongetMenuRestaurant,
  }) {
    return ongetMenuRestaurant(mitraId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int mitraId)? ongetMenuRestaurant,
  }) {
    return ongetMenuRestaurant?.call(mitraId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int mitraId)? ongetMenuRestaurant,
    required TResult orElse(),
  }) {
    if (ongetMenuRestaurant != null) {
      return ongetMenuRestaurant(mitraId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MenuRestaurantUserEvent value)
        ongetMenuRestaurant,
  }) {
    return ongetMenuRestaurant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MenuRestaurantUserEvent value)? ongetMenuRestaurant,
  }) {
    return ongetMenuRestaurant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuRestaurantUserEvent value)? ongetMenuRestaurant,
    required TResult orElse(),
  }) {
    if (ongetMenuRestaurant != null) {
      return ongetMenuRestaurant(this);
    }
    return orElse();
  }
}

abstract class MenuRestaurantUserEvent implements MenuRestaurantEvent {
  const factory MenuRestaurantUserEvent({required final int mitraId}) =
      _$MenuRestaurantUserEventImpl;

  @override
  int get mitraId;
  @override
  @JsonKey(ignore: true)
  _$$MenuRestaurantUserEventImplCopyWith<_$MenuRestaurantUserEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MenuRestaurantState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GetMenuResponse> response) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GetMenuResponse> response)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GetMenuResponse> response)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MenuRestaurantInitialState value) initial,
    required TResult Function(MenuRestaurantLoadingState value) loading,
    required TResult Function(MenuRestaurantErrorState value) error,
    required TResult Function(MenuRestaurantLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MenuRestaurantInitialState value)? initial,
    TResult? Function(MenuRestaurantLoadingState value)? loading,
    TResult? Function(MenuRestaurantErrorState value)? error,
    TResult? Function(MenuRestaurantLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuRestaurantInitialState value)? initial,
    TResult Function(MenuRestaurantLoadingState value)? loading,
    TResult Function(MenuRestaurantErrorState value)? error,
    TResult Function(MenuRestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuRestaurantStateCopyWith<$Res> {
  factory $MenuRestaurantStateCopyWith(
          MenuRestaurantState value, $Res Function(MenuRestaurantState) then) =
      _$MenuRestaurantStateCopyWithImpl<$Res, MenuRestaurantState>;
}

/// @nodoc
class _$MenuRestaurantStateCopyWithImpl<$Res, $Val extends MenuRestaurantState>
    implements $MenuRestaurantStateCopyWith<$Res> {
  _$MenuRestaurantStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MenuRestaurantInitialStateImplCopyWith<$Res> {
  factory _$$MenuRestaurantInitialStateImplCopyWith(
          _$MenuRestaurantInitialStateImpl value,
          $Res Function(_$MenuRestaurantInitialStateImpl) then) =
      __$$MenuRestaurantInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MenuRestaurantInitialStateImplCopyWithImpl<$Res>
    extends _$MenuRestaurantStateCopyWithImpl<$Res,
        _$MenuRestaurantInitialStateImpl>
    implements _$$MenuRestaurantInitialStateImplCopyWith<$Res> {
  __$$MenuRestaurantInitialStateImplCopyWithImpl(
      _$MenuRestaurantInitialStateImpl _value,
      $Res Function(_$MenuRestaurantInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MenuRestaurantInitialStateImpl implements MenuRestaurantInitialState {
  const _$MenuRestaurantInitialStateImpl();

  @override
  String toString() {
    return 'MenuRestaurantState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuRestaurantInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GetMenuResponse> response) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GetMenuResponse> response)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GetMenuResponse> response)? loaded,
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
    required TResult Function(MenuRestaurantInitialState value) initial,
    required TResult Function(MenuRestaurantLoadingState value) loading,
    required TResult Function(MenuRestaurantErrorState value) error,
    required TResult Function(MenuRestaurantLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MenuRestaurantInitialState value)? initial,
    TResult? Function(MenuRestaurantLoadingState value)? loading,
    TResult? Function(MenuRestaurantErrorState value)? error,
    TResult? Function(MenuRestaurantLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuRestaurantInitialState value)? initial,
    TResult Function(MenuRestaurantLoadingState value)? loading,
    TResult Function(MenuRestaurantErrorState value)? error,
    TResult Function(MenuRestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MenuRestaurantInitialState implements MenuRestaurantState {
  const factory MenuRestaurantInitialState() = _$MenuRestaurantInitialStateImpl;
}

/// @nodoc
abstract class _$$MenuRestaurantLoadingStateImplCopyWith<$Res> {
  factory _$$MenuRestaurantLoadingStateImplCopyWith(
          _$MenuRestaurantLoadingStateImpl value,
          $Res Function(_$MenuRestaurantLoadingStateImpl) then) =
      __$$MenuRestaurantLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MenuRestaurantLoadingStateImplCopyWithImpl<$Res>
    extends _$MenuRestaurantStateCopyWithImpl<$Res,
        _$MenuRestaurantLoadingStateImpl>
    implements _$$MenuRestaurantLoadingStateImplCopyWith<$Res> {
  __$$MenuRestaurantLoadingStateImplCopyWithImpl(
      _$MenuRestaurantLoadingStateImpl _value,
      $Res Function(_$MenuRestaurantLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MenuRestaurantLoadingStateImpl implements MenuRestaurantLoadingState {
  const _$MenuRestaurantLoadingStateImpl();

  @override
  String toString() {
    return 'MenuRestaurantState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuRestaurantLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GetMenuResponse> response) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GetMenuResponse> response)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GetMenuResponse> response)? loaded,
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
    required TResult Function(MenuRestaurantInitialState value) initial,
    required TResult Function(MenuRestaurantLoadingState value) loading,
    required TResult Function(MenuRestaurantErrorState value) error,
    required TResult Function(MenuRestaurantLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MenuRestaurantInitialState value)? initial,
    TResult? Function(MenuRestaurantLoadingState value)? loading,
    TResult? Function(MenuRestaurantErrorState value)? error,
    TResult? Function(MenuRestaurantLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuRestaurantInitialState value)? initial,
    TResult Function(MenuRestaurantLoadingState value)? loading,
    TResult Function(MenuRestaurantErrorState value)? error,
    TResult Function(MenuRestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MenuRestaurantLoadingState implements MenuRestaurantState {
  const factory MenuRestaurantLoadingState() = _$MenuRestaurantLoadingStateImpl;
}

/// @nodoc
abstract class _$$MenuRestaurantErrorStateImplCopyWith<$Res> {
  factory _$$MenuRestaurantErrorStateImplCopyWith(
          _$MenuRestaurantErrorStateImpl value,
          $Res Function(_$MenuRestaurantErrorStateImpl) then) =
      __$$MenuRestaurantErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MenuRestaurantErrorStateImplCopyWithImpl<$Res>
    extends _$MenuRestaurantStateCopyWithImpl<$Res,
        _$MenuRestaurantErrorStateImpl>
    implements _$$MenuRestaurantErrorStateImplCopyWith<$Res> {
  __$$MenuRestaurantErrorStateImplCopyWithImpl(
      _$MenuRestaurantErrorStateImpl _value,
      $Res Function(_$MenuRestaurantErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MenuRestaurantErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MenuRestaurantErrorStateImpl implements MenuRestaurantErrorState {
  const _$MenuRestaurantErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MenuRestaurantState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuRestaurantErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuRestaurantErrorStateImplCopyWith<_$MenuRestaurantErrorStateImpl>
      get copyWith => __$$MenuRestaurantErrorStateImplCopyWithImpl<
          _$MenuRestaurantErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GetMenuResponse> response) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GetMenuResponse> response)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GetMenuResponse> response)? loaded,
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
    required TResult Function(MenuRestaurantInitialState value) initial,
    required TResult Function(MenuRestaurantLoadingState value) loading,
    required TResult Function(MenuRestaurantErrorState value) error,
    required TResult Function(MenuRestaurantLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MenuRestaurantInitialState value)? initial,
    TResult? Function(MenuRestaurantLoadingState value)? loading,
    TResult? Function(MenuRestaurantErrorState value)? error,
    TResult? Function(MenuRestaurantLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuRestaurantInitialState value)? initial,
    TResult Function(MenuRestaurantLoadingState value)? loading,
    TResult Function(MenuRestaurantErrorState value)? error,
    TResult Function(MenuRestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MenuRestaurantErrorState implements MenuRestaurantState {
  const factory MenuRestaurantErrorState(final String message) =
      _$MenuRestaurantErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$MenuRestaurantErrorStateImplCopyWith<_$MenuRestaurantErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MenuRestaurantLoadedStateImplCopyWith<$Res> {
  factory _$$MenuRestaurantLoadedStateImplCopyWith(
          _$MenuRestaurantLoadedStateImpl value,
          $Res Function(_$MenuRestaurantLoadedStateImpl) then) =
      __$$MenuRestaurantLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GetMenuResponse> response});
}

/// @nodoc
class __$$MenuRestaurantLoadedStateImplCopyWithImpl<$Res>
    extends _$MenuRestaurantStateCopyWithImpl<$Res,
        _$MenuRestaurantLoadedStateImpl>
    implements _$$MenuRestaurantLoadedStateImplCopyWith<$Res> {
  __$$MenuRestaurantLoadedStateImplCopyWithImpl(
      _$MenuRestaurantLoadedStateImpl _value,
      $Res Function(_$MenuRestaurantLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$MenuRestaurantLoadedStateImpl(
      response: null == response
          ? _value._response
          : response // ignore: cast_nullable_to_non_nullable
              as List<GetMenuResponse>,
    ));
  }
}

/// @nodoc

class _$MenuRestaurantLoadedStateImpl implements MenuRestaurantLoadedState {
  const _$MenuRestaurantLoadedStateImpl(
      {required final List<GetMenuResponse> response})
      : _response = response;

  final List<GetMenuResponse> _response;
  @override
  List<GetMenuResponse> get response {
    if (_response is EqualUnmodifiableListView) return _response;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_response);
  }

  @override
  String toString() {
    return 'MenuRestaurantState.loaded(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuRestaurantLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._response, _response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_response));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuRestaurantLoadedStateImplCopyWith<_$MenuRestaurantLoadedStateImpl>
      get copyWith => __$$MenuRestaurantLoadedStateImplCopyWithImpl<
          _$MenuRestaurantLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GetMenuResponse> response) loaded,
  }) {
    return loaded(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GetMenuResponse> response)? loaded,
  }) {
    return loaded?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GetMenuResponse> response)? loaded,
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
    required TResult Function(MenuRestaurantInitialState value) initial,
    required TResult Function(MenuRestaurantLoadingState value) loading,
    required TResult Function(MenuRestaurantErrorState value) error,
    required TResult Function(MenuRestaurantLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MenuRestaurantInitialState value)? initial,
    TResult? Function(MenuRestaurantLoadingState value)? loading,
    TResult? Function(MenuRestaurantErrorState value)? error,
    TResult? Function(MenuRestaurantLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MenuRestaurantInitialState value)? initial,
    TResult Function(MenuRestaurantLoadingState value)? loading,
    TResult Function(MenuRestaurantErrorState value)? error,
    TResult Function(MenuRestaurantLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MenuRestaurantLoadedState implements MenuRestaurantState {
  const factory MenuRestaurantLoadedState(
          {required final List<GetMenuResponse> response}) =
      _$MenuRestaurantLoadedStateImpl;

  List<GetMenuResponse> get response;
  @JsonKey(ignore: true)
  _$$MenuRestaurantLoadedStateImplCopyWith<_$MenuRestaurantLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
