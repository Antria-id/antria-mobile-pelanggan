import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/datasources/reviews_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/repositories/reviews_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockReviewsRemoteDatasource extends Mock
    implements ReviewsRemoteDatasource {}

void main() {
  late ReviewsRepositoryImpl repository;
  late MockReviewsRemoteDatasource mockRemoteDatasource;

  setUpAll(() {
    mockRemoteDatasource = MockReviewsRemoteDatasource();
    repository = ReviewsRepositoryImpl();
    serviceLocator.registerLazySingleton<ReviewsRemoteDatasource>(
        () => mockRemoteDatasource);
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  final ReviewsRequest tReviewsRequest = ReviewsRequest(
      // initialize with appropriate fields
      );
  final int tMitraId = 1;

  test('should forward the call to the remote datasource', () async {
    // arrange
    when(() => mockRemoteDatasource.addReviews(
        reviewsRequest: tReviewsRequest,
        mitraId: tMitraId)).thenAnswer((_) async => Right(tReviewsRequest));

    // act
    final result = await repository.addReviews(
        reviewsRequest: tReviewsRequest, mitraId: tMitraId);

    // assert
    verify(() => mockRemoteDatasource.addReviews(
        reviewsRequest: tReviewsRequest, mitraId: tMitraId)).called(1);
    expect(result, Right(tReviewsRequest));
  });

  test('should return Failure when the remote call is unsuccessful', () async {
    // arrange
    when(() => mockRemoteDatasource.addReviews(
            reviewsRequest: tReviewsRequest, mitraId: tMitraId))
        .thenAnswer((_) async => Left(ConnectionFailure('')));

    // act
    final result = await repository.addReviews(
        reviewsRequest: tReviewsRequest, mitraId: tMitraId);

    // assert
    verify(() => mockRemoteDatasource.addReviews(
        reviewsRequest: tReviewsRequest, mitraId: tMitraId)).called(1);
    expect(result, Left(ConnectionFailure('')));
  });
}
