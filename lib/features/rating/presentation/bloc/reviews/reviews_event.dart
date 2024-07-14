part of 'reviews_bloc.dart';

@freezed
class ReviewsEvent with _$ReviewsEvent {
  const factory ReviewsEvent.onReviewsTapped(
      {required ReviewsRequest reviewsRequest}) = ReviewsUserEvent;
}
