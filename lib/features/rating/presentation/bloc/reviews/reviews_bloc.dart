import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/domain/usecases/reviews_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';
part 'reviews_bloc.freezed.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc() : super(const ReviewsInitialState()) {
    on<ReviewsEvent>((event, emit) async {
      final reviewsRequest = event.reviewsRequest;
      emit(const ReviewsState.loading());
      var result = await serviceLocator<ReviewsUsecase>()
          .addReviews(reviewsRequest, event.mitraId);
      result.fold(
        (failure) {
          emit(ReviewsState.error(failure.message));
        },
        (data) {
          emit(ReviewsState.loaded(reviewsRequest: reviewsRequest));
        },
      );
    });
  }
}
