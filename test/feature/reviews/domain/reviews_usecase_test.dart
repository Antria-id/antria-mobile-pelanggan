import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/domain/repositories/reviews_repository.dart';
import 'package:antria_mobile_pelanggan/features/rating/domain/usecases/reviews_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockReviewsRepository extends Mock implements ReviewsRepository {}

class FakeReviewsRequest extends Fake implements ReviewsRequest {}

void main() {
  late ReviewsUsecase usecase;
  late MockReviewsRepository mockReviewsRepository;

  setUpAll(() {
    registerFallbackValue(FakeReviewsRequest());
  });

  setUp(() {
    mockReviewsRepository = MockReviewsRepository();
    if (serviceLocator.isRegistered<ReviewsRepository>()) {
      serviceLocator.unregister<ReviewsRepository>();
    }
    serviceLocator
        .registerLazySingleton<ReviewsRepository>(() => mockReviewsRepository);
    usecase = ReviewsUsecase();
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  final tReviewsRequest = ReviewsRequest(
    komentar: "Great service",
    rating: 5,
    mitraId: 123,
    pelangganId: 456,
  );
  final int tMitraId = 1;

  test(
    'should add review to the repository and return the request',
    () async {
      // arrange
      when(() => mockReviewsRepository.addReviews(
            reviewsRequest: any(named: 'reviewsRequest'),
          )).thenAnswer((_) async => Right(tReviewsRequest));

      // act
      final result = await usecase.addReviews(tReviewsRequest);

      // assert
      expect(result, Right(tReviewsRequest));
      verify(() =>
          mockReviewsRepository.addReviews(reviewsRequest: tReviewsRequest));
      verifyNoMoreInteractions(mockReviewsRepository);
    },
  );

  test(
    'should return Failure when adding review is unsuccessful',
    () async {
      // arrange
      when(() => mockReviewsRepository.addReviews(
            reviewsRequest: any(named: 'reviewsRequest'),
          )).thenAnswer((_) async => Left(ConnectionFailure('')));

      // act
      final result = await usecase.addReviews(tReviewsRequest);

      // assert
      expect(result, Left(ConnectionFailure('')));
      verify(() =>
          mockReviewsRepository.addReviews(reviewsRequest: tReviewsRequest));
      verifyNoMoreInteractions(mockReviewsRepository);
    },
  );
}
