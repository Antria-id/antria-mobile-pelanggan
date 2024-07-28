import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/response/reviews_response_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/domain/usecases/reviews_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc() : super(ReviewsInitial()) {
    on<GetReviewsListEvent>(_GetReviews);
    on<ReviewsPostTapped>(_ReviewsPost);
    on<ReviewsUpdateTapped>(_ReviewsUpdate);
  }

  Future<void> _GetReviews(
    GetReviewsListEvent event,
    Emitter<ReviewsState> emit,
  ) async {
    emit(ReviewsLoading());
    final result =
        await serviceLocator<ReviewsUsecase>().getReviews(event.mitraId);
    result.fold(
      (failure) => emit(ReviewsEmpty()),
      (response) {
        if (response.komentar!.isEmpty || response.rating == null) {
          emit(ReviewsEmpty());
        } else {
          emit(ReviewsLoaded(response: response));
        }
      },
    );
  }

  Future<void> _ReviewsPost(
    ReviewsPostTapped event,
    Emitter<ReviewsState> emit,
  ) async {
    emit(ReviewsLoading());
    final result =
        await serviceLocator<ReviewsUsecase>().addReviews(event.reviewsRequest);
    result.fold(
      (failure) => emit(ReviewsError(message: failure.message)),
      (_) {
        emit(ReviewsPostTappedList());
        print('Product successfully added to the order list.');
      },
    );
  }

  Future<void> _ReviewsUpdate(
    ReviewsUpdateTapped event,
    Emitter<ReviewsState> emit,
  ) async {
    emit(ReviewsLoading());
    final result = await serviceLocator<ReviewsUsecase>()
        .updateReviews(event.reviewsUpdateRequest, event.mitraId);
    result.fold(
      (failure) => emit(ReviewsError(message: failure.message)),
      (_) {
        emit(ReviewsUpdateTappedList());
        print('Update successfully added to the order list.');
      },
    );
  }
}
