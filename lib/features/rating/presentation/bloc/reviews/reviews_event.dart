part of 'reviews_bloc.dart';

sealed class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}

final class ReviewsFetchData extends ReviewsEvent {
  final int mitraId;
  final int pelangganId;

  ReviewsFetchData({required this.mitraId, required this.pelangganId});

  @override
  List<Object> get props => [mitraId, pelangganId];
}

class GetReviewsListEvent extends ReviewsEvent {
  final int mitraId;

  GetReviewsListEvent({required this.mitraId});

  @override
  List<Object> get props => [mitraId];
}

final class ReviewsPostTapped extends ReviewsEvent {
  final ReviewsRequest reviewsRequest;

  ReviewsPostTapped({required this.reviewsRequest});

  @override
  List<Object> get props => [reviewsRequest];
}

final class ReviewsUpdateTapped extends ReviewsEvent {
  final ReviewsRequest reviewsUpdateRequest;
  final int mitraId;

  ReviewsUpdateTapped(this.mitraId, {required this.reviewsUpdateRequest});

  @override
  List<Object> get props => [reviewsUpdateRequest];
}
