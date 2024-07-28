part of 'reviews_bloc.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsLoaded extends ReviewsState {
  final ReviewsResponse response;

  const ReviewsLoaded({required this.response});
}

final class ReviewsEmpty extends ReviewsState {}

class ReviewsPostTappedList extends ReviewsState {}

class ReviewsUpdateTappedList extends ReviewsState {}

class ReviewsError extends ReviewsState {
  final String message;

  ReviewsError({required this.message});

  @override
  List<Object> get props => [message];
}
