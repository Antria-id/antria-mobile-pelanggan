import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/datasources/reviews_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/response/reviews_response_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/domain/repositories/reviews_repository.dart';
import 'package:dartz/dartz.dart';

class ReviewsRepositoryImpl extends ReviewsRepository {
  @override
  Future<Either<Failure, ReviewsResponse>> getReviews({required int mitraId}) {
    return serviceLocator<ReviewsRemoteDatasource>()
        .getReviews(mitraId: mitraId);
  }

  @override
  Future<Either<Failure, ReviewsRequest>> addReviews(
      {required ReviewsRequest reviewsRequest}) {
    return serviceLocator<ReviewsRemoteDatasource>()
        .addReviews(reviewsRequest: reviewsRequest);
  }

  @override
  Future<Either<Failure, ReviewsRequest>> updateReviews(
      {required ReviewsRequest reviewsUpdateRequest, required int mitraId}) {
    return serviceLocator<ReviewsRemoteDatasource>().updateReviews(
        reviewsUpdateRequest: reviewsUpdateRequest, mitraId: mitraId);
  }
}
