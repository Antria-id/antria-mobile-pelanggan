part of 'reviews_bloc.dart';

@freezed
class ReviewsState with _$ReviewsState {
  const factory ReviewsState.initial() = ReviewsInitialState;
  const factory ReviewsState.loading() = ReviewsLoadingState;
  const factory ReviewsState.error(String message) = ReviewsErrorState;
  const factory ReviewsState.loaded({
    required ReviewsRequest reviewsRequest,
  }) = ReviewsLoadedState;
}
