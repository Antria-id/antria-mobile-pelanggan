// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reviews_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReviewsEvent {
  ReviewsRequest get reviewsRequest => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReviewsRequest reviewsRequest) onReviewsTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReviewsRequest reviewsRequest)? onReviewsTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReviewsRequest reviewsRequest)? onReviewsTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewsUserEvent value) onReviewsTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsUserEvent value)? onReviewsTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsUserEvent value)? onReviewsTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReviewsEventCopyWith<ReviewsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsEventCopyWith<$Res> {
  factory $ReviewsEventCopyWith(
          ReviewsEvent value, $Res Function(ReviewsEvent) then) =
      _$ReviewsEventCopyWithImpl<$Res, ReviewsEvent>;
  @useResult
  $Res call({ReviewsRequest reviewsRequest});
}

/// @nodoc
class _$ReviewsEventCopyWithImpl<$Res, $Val extends ReviewsEvent>
    implements $ReviewsEventCopyWith<$Res> {
  _$ReviewsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewsRequest = null,
  }) {
    return _then(_value.copyWith(
      reviewsRequest: null == reviewsRequest
          ? _value.reviewsRequest
          : reviewsRequest // ignore: cast_nullable_to_non_nullable
              as ReviewsRequest,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewsUserEventImplCopyWith<$Res>
    implements $ReviewsEventCopyWith<$Res> {
  factory _$$ReviewsUserEventImplCopyWith(_$ReviewsUserEventImpl value,
          $Res Function(_$ReviewsUserEventImpl) then) =
      __$$ReviewsUserEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ReviewsRequest reviewsRequest});
}

/// @nodoc
class __$$ReviewsUserEventImplCopyWithImpl<$Res>
    extends _$ReviewsEventCopyWithImpl<$Res, _$ReviewsUserEventImpl>
    implements _$$ReviewsUserEventImplCopyWith<$Res> {
  __$$ReviewsUserEventImplCopyWithImpl(_$ReviewsUserEventImpl _value,
      $Res Function(_$ReviewsUserEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewsRequest = null,
  }) {
    return _then(_$ReviewsUserEventImpl(
      reviewsRequest: null == reviewsRequest
          ? _value.reviewsRequest
          : reviewsRequest // ignore: cast_nullable_to_non_nullable
              as ReviewsRequest,
    ));
  }
}

/// @nodoc

class _$ReviewsUserEventImpl implements ReviewsUserEvent {
  const _$ReviewsUserEventImpl({required this.reviewsRequest});

  @override
  final ReviewsRequest reviewsRequest;

  @override
  String toString() {
    return 'ReviewsEvent.onReviewsTapped(reviewsRequest: $reviewsRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsUserEventImpl &&
            (identical(other.reviewsRequest, reviewsRequest) ||
                other.reviewsRequest == reviewsRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reviewsRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsUserEventImplCopyWith<_$ReviewsUserEventImpl> get copyWith =>
      __$$ReviewsUserEventImplCopyWithImpl<_$ReviewsUserEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ReviewsRequest reviewsRequest) onReviewsTapped,
  }) {
    return onReviewsTapped(reviewsRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ReviewsRequest reviewsRequest)? onReviewsTapped,
  }) {
    return onReviewsTapped?.call(reviewsRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ReviewsRequest reviewsRequest)? onReviewsTapped,
    required TResult orElse(),
  }) {
    if (onReviewsTapped != null) {
      return onReviewsTapped(reviewsRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewsUserEvent value) onReviewsTapped,
  }) {
    return onReviewsTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsUserEvent value)? onReviewsTapped,
  }) {
    return onReviewsTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsUserEvent value)? onReviewsTapped,
    required TResult orElse(),
  }) {
    if (onReviewsTapped != null) {
      return onReviewsTapped(this);
    }
    return orElse();
  }
}

abstract class ReviewsUserEvent implements ReviewsEvent {
  const factory ReviewsUserEvent(
      {required final ReviewsRequest reviewsRequest}) = _$ReviewsUserEventImpl;

  @override
  ReviewsRequest get reviewsRequest;
  @override
  @JsonKey(ignore: true)
  _$$ReviewsUserEventImplCopyWith<_$ReviewsUserEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ReviewsRequest reviewsRequest) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ReviewsRequest reviewsRequest)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ReviewsRequest reviewsRequest)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewsInitialState value) initial,
    required TResult Function(ReviewsLoadingState value) loading,
    required TResult Function(ReviewsErrorState value) error,
    required TResult Function(ReviewsLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsInitialState value)? initial,
    TResult? Function(ReviewsLoadingState value)? loading,
    TResult? Function(ReviewsErrorState value)? error,
    TResult? Function(ReviewsLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsInitialState value)? initial,
    TResult Function(ReviewsLoadingState value)? loading,
    TResult Function(ReviewsErrorState value)? error,
    TResult Function(ReviewsLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewsStateCopyWith<$Res> {
  factory $ReviewsStateCopyWith(
          ReviewsState value, $Res Function(ReviewsState) then) =
      _$ReviewsStateCopyWithImpl<$Res, ReviewsState>;
}

/// @nodoc
class _$ReviewsStateCopyWithImpl<$Res, $Val extends ReviewsState>
    implements $ReviewsStateCopyWith<$Res> {
  _$ReviewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ReviewsInitialStateImplCopyWith<$Res> {
  factory _$$ReviewsInitialStateImplCopyWith(_$ReviewsInitialStateImpl value,
          $Res Function(_$ReviewsInitialStateImpl) then) =
      __$$ReviewsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReviewsInitialStateImplCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$ReviewsInitialStateImpl>
    implements _$$ReviewsInitialStateImplCopyWith<$Res> {
  __$$ReviewsInitialStateImplCopyWithImpl(_$ReviewsInitialStateImpl _value,
      $Res Function(_$ReviewsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReviewsInitialStateImpl implements ReviewsInitialState {
  const _$ReviewsInitialStateImpl();

  @override
  String toString() {
    return 'ReviewsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ReviewsRequest reviewsRequest) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ReviewsRequest reviewsRequest)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ReviewsRequest reviewsRequest)? loaded,
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
    required TResult Function(ReviewsInitialState value) initial,
    required TResult Function(ReviewsLoadingState value) loading,
    required TResult Function(ReviewsErrorState value) error,
    required TResult Function(ReviewsLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsInitialState value)? initial,
    TResult? Function(ReviewsLoadingState value)? loading,
    TResult? Function(ReviewsErrorState value)? error,
    TResult? Function(ReviewsLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsInitialState value)? initial,
    TResult Function(ReviewsLoadingState value)? loading,
    TResult Function(ReviewsErrorState value)? error,
    TResult Function(ReviewsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ReviewsInitialState implements ReviewsState {
  const factory ReviewsInitialState() = _$ReviewsInitialStateImpl;
}

/// @nodoc
abstract class _$$ReviewsLoadingStateImplCopyWith<$Res> {
  factory _$$ReviewsLoadingStateImplCopyWith(_$ReviewsLoadingStateImpl value,
          $Res Function(_$ReviewsLoadingStateImpl) then) =
      __$$ReviewsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReviewsLoadingStateImplCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$ReviewsLoadingStateImpl>
    implements _$$ReviewsLoadingStateImplCopyWith<$Res> {
  __$$ReviewsLoadingStateImplCopyWithImpl(_$ReviewsLoadingStateImpl _value,
      $Res Function(_$ReviewsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ReviewsLoadingStateImpl implements ReviewsLoadingState {
  const _$ReviewsLoadingStateImpl();

  @override
  String toString() {
    return 'ReviewsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ReviewsRequest reviewsRequest) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ReviewsRequest reviewsRequest)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ReviewsRequest reviewsRequest)? loaded,
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
    required TResult Function(ReviewsInitialState value) initial,
    required TResult Function(ReviewsLoadingState value) loading,
    required TResult Function(ReviewsErrorState value) error,
    required TResult Function(ReviewsLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsInitialState value)? initial,
    TResult? Function(ReviewsLoadingState value)? loading,
    TResult? Function(ReviewsErrorState value)? error,
    TResult? Function(ReviewsLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsInitialState value)? initial,
    TResult Function(ReviewsLoadingState value)? loading,
    TResult Function(ReviewsErrorState value)? error,
    TResult Function(ReviewsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ReviewsLoadingState implements ReviewsState {
  const factory ReviewsLoadingState() = _$ReviewsLoadingStateImpl;
}

/// @nodoc
abstract class _$$ReviewsErrorStateImplCopyWith<$Res> {
  factory _$$ReviewsErrorStateImplCopyWith(_$ReviewsErrorStateImpl value,
          $Res Function(_$ReviewsErrorStateImpl) then) =
      __$$ReviewsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ReviewsErrorStateImplCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$ReviewsErrorStateImpl>
    implements _$$ReviewsErrorStateImplCopyWith<$Res> {
  __$$ReviewsErrorStateImplCopyWithImpl(_$ReviewsErrorStateImpl _value,
      $Res Function(_$ReviewsErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ReviewsErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReviewsErrorStateImpl implements ReviewsErrorState {
  const _$ReviewsErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ReviewsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsErrorStateImplCopyWith<_$ReviewsErrorStateImpl> get copyWith =>
      __$$ReviewsErrorStateImplCopyWithImpl<_$ReviewsErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ReviewsRequest reviewsRequest) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ReviewsRequest reviewsRequest)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ReviewsRequest reviewsRequest)? loaded,
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
    required TResult Function(ReviewsInitialState value) initial,
    required TResult Function(ReviewsLoadingState value) loading,
    required TResult Function(ReviewsErrorState value) error,
    required TResult Function(ReviewsLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsInitialState value)? initial,
    TResult? Function(ReviewsLoadingState value)? loading,
    TResult? Function(ReviewsErrorState value)? error,
    TResult? Function(ReviewsLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsInitialState value)? initial,
    TResult Function(ReviewsLoadingState value)? loading,
    TResult Function(ReviewsErrorState value)? error,
    TResult Function(ReviewsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ReviewsErrorState implements ReviewsState {
  const factory ReviewsErrorState(final String message) =
      _$ReviewsErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ReviewsErrorStateImplCopyWith<_$ReviewsErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReviewsLoadedStateImplCopyWith<$Res> {
  factory _$$ReviewsLoadedStateImplCopyWith(_$ReviewsLoadedStateImpl value,
          $Res Function(_$ReviewsLoadedStateImpl) then) =
      __$$ReviewsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ReviewsRequest reviewsRequest});
}

/// @nodoc
class __$$ReviewsLoadedStateImplCopyWithImpl<$Res>
    extends _$ReviewsStateCopyWithImpl<$Res, _$ReviewsLoadedStateImpl>
    implements _$$ReviewsLoadedStateImplCopyWith<$Res> {
  __$$ReviewsLoadedStateImplCopyWithImpl(_$ReviewsLoadedStateImpl _value,
      $Res Function(_$ReviewsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviewsRequest = null,
  }) {
    return _then(_$ReviewsLoadedStateImpl(
      reviewsRequest: null == reviewsRequest
          ? _value.reviewsRequest
          : reviewsRequest // ignore: cast_nullable_to_non_nullable
              as ReviewsRequest,
    ));
  }
}

/// @nodoc

class _$ReviewsLoadedStateImpl implements ReviewsLoadedState {
  const _$ReviewsLoadedStateImpl({required this.reviewsRequest});

  @override
  final ReviewsRequest reviewsRequest;

  @override
  String toString() {
    return 'ReviewsState.loaded(reviewsRequest: $reviewsRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewsLoadedStateImpl &&
            (identical(other.reviewsRequest, reviewsRequest) ||
                other.reviewsRequest == reviewsRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, reviewsRequest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewsLoadedStateImplCopyWith<_$ReviewsLoadedStateImpl> get copyWith =>
      __$$ReviewsLoadedStateImplCopyWithImpl<_$ReviewsLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(ReviewsRequest reviewsRequest) loaded,
  }) {
    return loaded(reviewsRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(ReviewsRequest reviewsRequest)? loaded,
  }) {
    return loaded?.call(reviewsRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(ReviewsRequest reviewsRequest)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(reviewsRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ReviewsInitialState value) initial,
    required TResult Function(ReviewsLoadingState value) loading,
    required TResult Function(ReviewsErrorState value) error,
    required TResult Function(ReviewsLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ReviewsInitialState value)? initial,
    TResult? Function(ReviewsLoadingState value)? loading,
    TResult? Function(ReviewsErrorState value)? error,
    TResult? Function(ReviewsLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ReviewsInitialState value)? initial,
    TResult Function(ReviewsLoadingState value)? loading,
    TResult Function(ReviewsErrorState value)? error,
    TResult Function(ReviewsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ReviewsLoadedState implements ReviewsState {
  const factory ReviewsLoadedState(
          {required final ReviewsRequest reviewsRequest}) =
      _$ReviewsLoadedStateImpl;

  ReviewsRequest get reviewsRequest;
  @JsonKey(ignore: true)
  _$$ReviewsLoadedStateImplCopyWith<_$ReviewsLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
