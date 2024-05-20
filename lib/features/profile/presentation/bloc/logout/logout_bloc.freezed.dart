// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LogoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLogoutTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLogoutTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLogoutTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutUserEvent value) onLogoutTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutUserEvent value)? onLogoutTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutUserEvent value)? onLogoutTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutEventCopyWith<$Res> {
  factory $LogoutEventCopyWith(
          LogoutEvent value, $Res Function(LogoutEvent) then) =
      _$LogoutEventCopyWithImpl<$Res, LogoutEvent>;
}

/// @nodoc
class _$LogoutEventCopyWithImpl<$Res, $Val extends LogoutEvent>
    implements $LogoutEventCopyWith<$Res> {
  _$LogoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LogoutUserEventImplCopyWith<$Res> {
  factory _$$LogoutUserEventImplCopyWith(_$LogoutUserEventImpl value,
          $Res Function(_$LogoutUserEventImpl) then) =
      __$$LogoutUserEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutUserEventImplCopyWithImpl<$Res>
    extends _$LogoutEventCopyWithImpl<$Res, _$LogoutUserEventImpl>
    implements _$$LogoutUserEventImplCopyWith<$Res> {
  __$$LogoutUserEventImplCopyWithImpl(
      _$LogoutUserEventImpl _value, $Res Function(_$LogoutUserEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutUserEventImpl implements LogoutUserEvent {
  const _$LogoutUserEventImpl();

  @override
  String toString() {
    return 'LogoutEvent.onLogoutTapped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutUserEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLogoutTapped,
  }) {
    return onLogoutTapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLogoutTapped,
  }) {
    return onLogoutTapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLogoutTapped,
    required TResult orElse(),
  }) {
    if (onLogoutTapped != null) {
      return onLogoutTapped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutUserEvent value) onLogoutTapped,
  }) {
    return onLogoutTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutUserEvent value)? onLogoutTapped,
  }) {
    return onLogoutTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutUserEvent value)? onLogoutTapped,
    required TResult orElse(),
  }) {
    if (onLogoutTapped != null) {
      return onLogoutTapped(this);
    }
    return orElse();
  }
}

abstract class LogoutUserEvent implements LogoutEvent {
  const factory LogoutUserEvent() = _$LogoutUserEventImpl;
}

/// @nodoc
mixin _$LogoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserModel? user) loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserModel? user)? loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserModel? user)? loadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutInitialState value) initial,
    required TResult Function(LogoutLoadingState value) loading,
    required TResult Function(LogoutErrorState value) error,
    required TResult Function(LogoutLoadedState value) loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutInitialState value)? initial,
    TResult? Function(LogoutLoadingState value)? loading,
    TResult? Function(LogoutErrorState value)? error,
    TResult? Function(LogoutLoadedState value)? loadedState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutInitialState value)? initial,
    TResult Function(LogoutLoadingState value)? loading,
    TResult Function(LogoutErrorState value)? error,
    TResult Function(LogoutLoadedState value)? loadedState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutStateCopyWith<$Res> {
  factory $LogoutStateCopyWith(
          LogoutState value, $Res Function(LogoutState) then) =
      _$LogoutStateCopyWithImpl<$Res, LogoutState>;
}

/// @nodoc
class _$LogoutStateCopyWithImpl<$Res, $Val extends LogoutState>
    implements $LogoutStateCopyWith<$Res> {
  _$LogoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LogoutInitialStateImplCopyWith<$Res> {
  factory _$$LogoutInitialStateImplCopyWith(_$LogoutInitialStateImpl value,
          $Res Function(_$LogoutInitialStateImpl) then) =
      __$$LogoutInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutInitialStateImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutInitialStateImpl>
    implements _$$LogoutInitialStateImplCopyWith<$Res> {
  __$$LogoutInitialStateImplCopyWithImpl(_$LogoutInitialStateImpl _value,
      $Res Function(_$LogoutInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutInitialStateImpl implements LogoutInitialState {
  const _$LogoutInitialStateImpl();

  @override
  String toString() {
    return 'LogoutState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserModel? user) loadedState,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserModel? user)? loadedState,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserModel? user)? loadedState,
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
    required TResult Function(LogoutInitialState value) initial,
    required TResult Function(LogoutLoadingState value) loading,
    required TResult Function(LogoutErrorState value) error,
    required TResult Function(LogoutLoadedState value) loadedState,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutInitialState value)? initial,
    TResult? Function(LogoutLoadingState value)? loading,
    TResult? Function(LogoutErrorState value)? error,
    TResult? Function(LogoutLoadedState value)? loadedState,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutInitialState value)? initial,
    TResult Function(LogoutLoadingState value)? loading,
    TResult Function(LogoutErrorState value)? error,
    TResult Function(LogoutLoadedState value)? loadedState,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LogoutInitialState implements LogoutState {
  const factory LogoutInitialState() = _$LogoutInitialStateImpl;
}

/// @nodoc
abstract class _$$LogoutLoadingStateImplCopyWith<$Res> {
  factory _$$LogoutLoadingStateImplCopyWith(_$LogoutLoadingStateImpl value,
          $Res Function(_$LogoutLoadingStateImpl) then) =
      __$$LogoutLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutLoadingStateImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutLoadingStateImpl>
    implements _$$LogoutLoadingStateImplCopyWith<$Res> {
  __$$LogoutLoadingStateImplCopyWithImpl(_$LogoutLoadingStateImpl _value,
      $Res Function(_$LogoutLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutLoadingStateImpl implements LogoutLoadingState {
  const _$LogoutLoadingStateImpl();

  @override
  String toString() {
    return 'LogoutState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserModel? user) loadedState,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserModel? user)? loadedState,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserModel? user)? loadedState,
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
    required TResult Function(LogoutInitialState value) initial,
    required TResult Function(LogoutLoadingState value) loading,
    required TResult Function(LogoutErrorState value) error,
    required TResult Function(LogoutLoadedState value) loadedState,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutInitialState value)? initial,
    TResult? Function(LogoutLoadingState value)? loading,
    TResult? Function(LogoutErrorState value)? error,
    TResult? Function(LogoutLoadedState value)? loadedState,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutInitialState value)? initial,
    TResult Function(LogoutLoadingState value)? loading,
    TResult Function(LogoutErrorState value)? error,
    TResult Function(LogoutLoadedState value)? loadedState,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LogoutLoadingState implements LogoutState {
  const factory LogoutLoadingState() = _$LogoutLoadingStateImpl;
}

/// @nodoc
abstract class _$$LogoutErrorStateImplCopyWith<$Res> {
  factory _$$LogoutErrorStateImplCopyWith(_$LogoutErrorStateImpl value,
          $Res Function(_$LogoutErrorStateImpl) then) =
      __$$LogoutErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LogoutErrorStateImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutErrorStateImpl>
    implements _$$LogoutErrorStateImplCopyWith<$Res> {
  __$$LogoutErrorStateImplCopyWithImpl(_$LogoutErrorStateImpl _value,
      $Res Function(_$LogoutErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LogoutErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogoutErrorStateImpl implements LogoutErrorState {
  const _$LogoutErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LogoutState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutErrorStateImplCopyWith<_$LogoutErrorStateImpl> get copyWith =>
      __$$LogoutErrorStateImplCopyWithImpl<_$LogoutErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserModel? user) loadedState,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserModel? user)? loadedState,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserModel? user)? loadedState,
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
    required TResult Function(LogoutInitialState value) initial,
    required TResult Function(LogoutLoadingState value) loading,
    required TResult Function(LogoutErrorState value) error,
    required TResult Function(LogoutLoadedState value) loadedState,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutInitialState value)? initial,
    TResult? Function(LogoutLoadingState value)? loading,
    TResult? Function(LogoutErrorState value)? error,
    TResult? Function(LogoutLoadedState value)? loadedState,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutInitialState value)? initial,
    TResult Function(LogoutLoadingState value)? loading,
    TResult Function(LogoutErrorState value)? error,
    TResult Function(LogoutLoadedState value)? loadedState,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LogoutErrorState implements LogoutState {
  const factory LogoutErrorState(final String message) = _$LogoutErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$LogoutErrorStateImplCopyWith<_$LogoutErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutLoadedStateImplCopyWith<$Res> {
  factory _$$LogoutLoadedStateImplCopyWith(_$LogoutLoadedStateImpl value,
          $Res Function(_$LogoutLoadedStateImpl) then) =
      __$$LogoutLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel? user});
}

/// @nodoc
class __$$LogoutLoadedStateImplCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutLoadedStateImpl>
    implements _$$LogoutLoadedStateImplCopyWith<$Res> {
  __$$LogoutLoadedStateImplCopyWithImpl(_$LogoutLoadedStateImpl _value,
      $Res Function(_$LogoutLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(_$LogoutLoadedStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
    ));
  }
}

/// @nodoc

class _$LogoutLoadedStateImpl implements LogoutLoadedState {
  const _$LogoutLoadedStateImpl({required this.user});

  @override
  final UserModel? user;

  @override
  String toString() {
    return 'LogoutState.loadedState(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutLoadedStateImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutLoadedStateImplCopyWith<_$LogoutLoadedStateImpl> get copyWith =>
      __$$LogoutLoadedStateImplCopyWithImpl<_$LogoutLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserModel? user) loadedState,
  }) {
    return loadedState(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserModel? user)? loadedState,
  }) {
    return loadedState?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserModel? user)? loadedState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutInitialState value) initial,
    required TResult Function(LogoutLoadingState value) loading,
    required TResult Function(LogoutErrorState value) error,
    required TResult Function(LogoutLoadedState value) loadedState,
  }) {
    return loadedState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutInitialState value)? initial,
    TResult? Function(LogoutLoadingState value)? loading,
    TResult? Function(LogoutErrorState value)? error,
    TResult? Function(LogoutLoadedState value)? loadedState,
  }) {
    return loadedState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutInitialState value)? initial,
    TResult Function(LogoutLoadingState value)? loading,
    TResult Function(LogoutErrorState value)? error,
    TResult Function(LogoutLoadedState value)? loadedState,
    required TResult orElse(),
  }) {
    if (loadedState != null) {
      return loadedState(this);
    }
    return orElse();
  }
}

abstract class LogoutLoadedState implements LogoutState {
  const factory LogoutLoadedState({required final UserModel? user}) =
      _$LogoutLoadedStateImpl;

  UserModel? get user;
  @JsonKey(ignore: true)
  _$$LogoutLoadedStateImplCopyWith<_$LogoutLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
