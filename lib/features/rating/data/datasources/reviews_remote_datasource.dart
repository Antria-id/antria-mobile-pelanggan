import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/response/reviews_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class ReviewsRemoteDatasource {
  Future<Either<Failure, PelangganModel>> getPelanggan();
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

class ReviewsRemoteDatasourceImpl extends ReviewsRemoteDatasource {
  @override
  Future<Either<Failure, PelangganModel>> getPelanggan() async {
    try {
      final Request request = serviceLocator<Request>();
      final UserCacheService userCacheService =
          serviceLocator<UserCacheService>();
      final UserModel? user = await userCacheService.getUser();
      if (user == null) {
        return const Left(
          ParsingFailure('User not found'),
        );
      }
      final int id = user.sub!;
      final response = await request.get(APIUrl.getPelangganPath(id));
      if (response.statusCode == 200) {
        final PelangganModel pelangganResponse =
            PelangganModel.fromJson(response.data);
        return Right(
          pelangganResponse,
        );
      }
      return Left(
        ConnectionFailure(response.data['message']),
      );
    } catch (e) {
      return const Left(
        ParsingFailure('Unable to parse the response'),
      );
    }
  }

  @override
  Future<Either<Failure, ReviewsResponse>> getReviews({
    required int mitraId,
  }) async {
    try {
      final Request request = serviceLocator<Request>();
      final UserCacheService userCacheService =
          serviceLocator<UserCacheService>();
      final UserModel? user = await userCacheService.getUser();
      if (user == null) {
        return const Left(
          ParsingFailure('User not found'),
        );
      }
      final int id = user.sub!;
      final response = await request.get(
        APIUrl.putReviewPath(mitraId, id),
      );
      if (response.statusCode == 200) {
        final ReviewsResponse reviewsResponse =
            ReviewsResponse.fromJson(response.data);
        return Right(
          reviewsResponse,
        );
      }
      return Left(
        ConnectionFailure(response.data['message']),
      );
    } catch (e) {
      return const Left(
        ParsingFailure('Unable to parse the response'),
      );
    }
  }

  @override
  Future<Either<Failure, ReviewsRequest>> addReviews({
    required ReviewsRequest reviewsRequest,
  }) async {
    try {
      final Request request = serviceLocator<Request>();
      final UserCacheService userCacheService =
          serviceLocator<UserCacheService>();
      final UserModel? user = await userCacheService.getUser();
      if (user == null) {
        return const Left(
          ParsingFailure('User not found'),
        );
      }
      final int id = user.sub!;
      reviewsRequest.pelangganId = id;
      final response = await request.post(APIUrl.postReviewPath,
          data: reviewsRequest.toJson());
      if (response.statusCode == 200) {
        final ReviewsRequest reviewsResponse =
            ReviewsRequest.fromJson(response.data);
        return Right(
          reviewsResponse,
        );
      }
      return Left(
        ConnectionFailure(response.data['message']),
      );
    } catch (e) {
      return const Left(
        ParsingFailure('Unable to parse the response'),
      );
    }
  }

  @override
  Future<Either<Failure, ReviewsRequest>> updateReviews({
    required ReviewsRequest reviewsUpdateRequest,
    required int mitraId,
  }) async {
    try {
      final Request request = serviceLocator<Request>();
      final UserCacheService userCacheService =
          serviceLocator<UserCacheService>();
      final UserModel? user = await userCacheService.getUser();
      if (user == null) {
        return const Left(
          ParsingFailure('User not found'),
        );
      }
      final int id = user.sub!;
      reviewsUpdateRequest.pelangganId = id;
      final response = await request.put(APIUrl.putReviewPath(mitraId, id),
          data: reviewsUpdateRequest.toJson());
      if (response.statusCode == 200) {
        final ReviewsRequest reviewsResponse =
            ReviewsRequest.fromJson(response.data);
        return Right(
          reviewsResponse,
        );
      }
      return Left(
        ConnectionFailure(response.data['message']),
      );
    } catch (e) {
      return const Left(
        ParsingFailure('Unable to parse the response'),
      );
    }
  }
}
