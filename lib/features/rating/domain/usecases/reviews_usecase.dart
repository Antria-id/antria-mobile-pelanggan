import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/domain/repositories/reviews_repository.dart';
import 'package:dartz/dartz.dart';

class ReviewsUsecase {
  Future<Either<Failure, ReviewsRequest>> addReviews(
      ReviewsRequest reviewsRequest) async {
    final response = await serviceLocator<ReviewsRepository>()
        .addReviews(reviewsRequest: reviewsRequest);
    return response;
  }
}
