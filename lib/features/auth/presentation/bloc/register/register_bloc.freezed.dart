// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterEvent {
  RegisterRequest get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterRequest user) onRegisterTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RegisterRequest user)? onRegisterTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterRequest user)? onRegisterTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterUserEvent value) onRegisterTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterUserEvent value)? onRegisterTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterUserEvent value)? onRegisterTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterEventCopyWith<RegisterEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
  @useResult
  $Res call({RegisterRequest user});
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as RegisterRequest,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterUserEventImplCopyWith<$Res>
    implements $RegisterEventCopyWith<$Res> {
  factory _$$RegisterUserEventImplCopyWith(_$RegisterUserEventImpl value,
          $Res Function(_$RegisterUserEventImpl) then) =
      __$$RegisterUserEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RegisterRequest user});
}

/// @nodoc
class __$$RegisterUserEventImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$RegisterUserEventImpl>
    implements _$$RegisterUserEventImplCopyWith<$Res> {
  __$$RegisterUserEventImplCopyWithImpl(_$RegisterUserEventImpl _value,
      $Res Function(_$RegisterUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$RegisterUserEventImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as RegisterRequest,
    ));
  }
}

/// @nodoc

class _$RegisterUserEventImpl implements RegisterUserEvent {
  const _$RegisterUserEventImpl({required this.user});

  @override
  final RegisterRequest user;

  @override
  String toString() {
    return 'RegisterEvent.onRegisterTapped(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterUserEventImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterUserEventImplCopyWith<_$RegisterUserEventImpl> get copyWith =>
      __$$RegisterUserEventImplCopyWithImpl<_$RegisterUserEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(RegisterRequest user) onRegisterTapped,
  }) {
    return onRegisterTapped(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(RegisterRequest user)? onRegisterTapped,
  }) {
    return onRegisterTapped?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(RegisterRequest user)? onRegisterTapped,
    required TResult orElse(),
  }) {
    if (onRegisterTapped != null) {
      return onRegisterTapped(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterUserEvent value) onRegisterTapped,
  }) {
    return onRegisterTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterUserEvent value)? onRegisterTapped,
  }) {
    return onRegisterTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterUserEvent value)? onRegisterTapped,
    required TResult orElse(),
  }) {
    if (onRegisterTapped != null) {
      return onRegisterTapped(this);
    }
    return orElse();
  }
}

abstract class RegisterUserEvent implements RegisterEvent {
  const factory RegisterUserEvent({required final RegisterRequest user}) =
      _$RegisterUserEventImpl;

  @override
  RegisterRequest get user;
  @override
  @JsonKey(ignore: true)
  _$$RegisterUserEventImplCopyWith<_$RegisterUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(RegisterRequest user) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(RegisterRequest user)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(RegisterRequest user)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterErrorState value) error,
    required TResult Function(RegisterLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterErrorState value)? error,
    TResult? Function(RegisterLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterErrorState value)? error,
    TResult Function(RegisterLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegisterInitialStateImplCopyWith<$Res> {
  factory _$$RegisterInitialStateImplCopyWith(_$RegisterInitialStateImpl value,
          $Res Function(_$RegisterInitialStateImpl) then) =
      __$$RegisterInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterInitialStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterInitialStateImpl>
    implements _$$RegisterInitialStateImplCopyWith<$Res> {
  __$$RegisterInitialStateImplCopyWithImpl(_$RegisterInitialStateImpl _value,
      $Res Function(_$RegisterInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterInitialStateImpl implements RegisterInitialState {
  const _$RegisterInitialStateImpl();

  @override
  String toString() {
    return 'RegisterState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(RegisterRequest user) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(RegisterRequest user)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(RegisterRequest user)? loaded,
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
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterErrorState value) error,
    required TResult Function(RegisterLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterErrorState value)? error,
    TResult? Function(RegisterLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterErrorState value)? error,
    TResult Function(RegisterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RegisterInitialState implements RegisterState {
  const factory RegisterInitialState() = _$RegisterInitialStateImpl;
}

/// @nodoc
abstract class _$$RegisterLoadingStateImplCopyWith<$Res> {
  factory _$$RegisterLoadingStateImplCopyWith(_$RegisterLoadingStateImpl value,
          $Res Function(_$RegisterLoadingStateImpl) then) =
      __$$RegisterLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterLoadingStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterLoadingStateImpl>
    implements _$$RegisterLoadingStateImplCopyWith<$Res> {
  __$$RegisterLoadingStateImplCopyWithImpl(_$RegisterLoadingStateImpl _value,
      $Res Function(_$RegisterLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterLoadingStateImpl implements RegisterLoadingState {
  const _$RegisterLoadingStateImpl();

  @override
  String toString() {
    return 'RegisterState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(RegisterRequest user) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(RegisterRequest user)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(RegisterRequest user)? loaded,
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
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterErrorState value) error,
    required TResult Function(RegisterLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterErrorState value)? error,
    TResult? Function(RegisterLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterErrorState value)? error,
    TResult Function(RegisterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RegisterLoadingState implements RegisterState {
  const factory RegisterLoadingState() = _$RegisterLoadingStateImpl;
}

/// @nodoc
abstract class _$$RegisterErrorStateImplCopyWith<$Res> {
  factory _$$RegisterErrorStateImplCopyWith(_$RegisterErrorStateImpl value,
          $Res Function(_$RegisterErrorStateImpl) then) =
      __$$RegisterErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegisterErrorStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterErrorStateImpl>
    implements _$$RegisterErrorStateImplCopyWith<$Res> {
  __$$RegisterErrorStateImplCopyWithImpl(_$RegisterErrorStateImpl _value,
      $Res Function(_$RegisterErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RegisterErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterErrorStateImpl implements RegisterErrorState {
  const _$RegisterErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorStateImplCopyWith<_$RegisterErrorStateImpl> get copyWith =>
      __$$RegisterErrorStateImplCopyWithImpl<_$RegisterErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(RegisterRequest user) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(RegisterRequest user)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(RegisterRequest user)? loaded,
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
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterErrorState value) error,
    required TResult Function(RegisterLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterErrorState value)? error,
    TResult? Function(RegisterLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterErrorState value)? error,
    TResult Function(RegisterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RegisterErrorState implements RegisterState {
  const factory RegisterErrorState(final String message) =
      _$RegisterErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RegisterErrorStateImplCopyWith<_$RegisterErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterLoadedStateImplCopyWith<$Res> {
  factory _$$RegisterLoadedStateImplCopyWith(_$RegisterLoadedStateImpl value,
          $Res Function(_$RegisterLoadedStateImpl) then) =
      __$$RegisterLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RegisterRequest user});
}

/// @nodoc
class __$$RegisterLoadedStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterLoadedStateImpl>
    implements _$$RegisterLoadedStateImplCopyWith<$Res> {
  __$$RegisterLoadedStateImplCopyWithImpl(_$RegisterLoadedStateImpl _value,
      $Res Function(_$RegisterLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$RegisterLoadedStateImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as RegisterRequest,
    ));
  }
}

/// @nodoc

class _$RegisterLoadedStateImpl implements RegisterLoadedState {
  const _$RegisterLoadedStateImpl({required this.user});

  @override
  final RegisterRequest user;

  @override
  String toString() {
    return 'RegisterState.loaded(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoadedStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterLoadedStateImplCopyWith<_$RegisterLoadedStateImpl> get copyWith =>
      __$$RegisterLoadedStateImplCopyWithImpl<_$RegisterLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(RegisterRequest user) loaded,
  }) {
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(RegisterRequest user)? loaded,
  }) {
    return loaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(RegisterRequest user)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterErrorState value) error,
    required TResult Function(RegisterLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterErrorState value)? error,
    TResult? Function(RegisterLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterErrorState value)? error,
    TResult Function(RegisterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RegisterLoadedState implements RegisterState {
  const factory RegisterLoadedState({required final RegisterRequest user}) =
      _$RegisterLoadedStateImpl;

  RegisterRequest get user;
  @JsonKey(ignore: true)
  _$$RegisterLoadedStateImplCopyWith<_$RegisterLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
