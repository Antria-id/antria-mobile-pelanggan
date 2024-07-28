import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/response/reviews_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class ReviewsRepository {
  Future<Either<Failure, ReviewsResponse>> getReviews({
    required int mitraId,
  });
  Future<Either<Failure, ReviewsRequest>> addReviews({
    required ReviewsRequest reviewsRequest,
  });

  Future<Either<Failure, ReviewsRequest>> updateReviews({
    required ReviewsRequest reviewsUpdateRequest,
    required int mitraId,
  });
}
