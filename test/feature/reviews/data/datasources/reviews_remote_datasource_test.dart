import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/datasources/reviews_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRequest extends Mock implements Request {}

class MockUserCacheService extends Mock implements UserCacheService {}

class MockRequestOptions extends Mock implements RequestOptions {}

void main() {
  late ReviewsRemoteDatasource datasource;
  late MockRequest mockRequest;
  late MockUserCacheService mockUserCacheService;
  late MockRequestOptions mockRequestOptions;

  setUp(() {
    mockRequest = MockRequest();
    mockUserCacheService = MockUserCacheService();
    mockRequestOptions = MockRequestOptions();
    datasource = ReviewsRemoteDatasourceImpl();
    serviceLocator.registerLazySingleton<Request>(() => mockRequest);
    serviceLocator
        .registerLazySingleton<UserCacheService>(() => mockUserCacheService);
  });

  tearDown(() async {
    await serviceLocator.reset(dispose: true);
  });

  group('getPelanggan', () {
    final tUserModel = UserModel(
      sub: 2,
      username: 'rovinos',
      role: '',
      iat: 1720319728,
      exp: 1720406128,
    );
    final tPelangganModel = PelangganModel(
      id: 2,
      username: 'rovino',
      password: '2b10Z022U4PS5NksQXTkiVXVOjtDbBtVUGqI3vWK0LpebezqgoQL0si',
      email: 'rovino@verni.yt',
      emailVerified: false,
      profilePicture: 'fea86402-094c-42c2-b791-149ae02cf5c9.jpg',
      nama: 'rovinos',
      handphone: '',
      alamat: '',
      wallet: 2025000,
      createdAt: DateTime.parse('2024-05-01T10:35:07.243Z'),
      updatedAt: DateTime.parse('2024-07-21T14:52:52.965Z'),
    );

    test('should return ParsingFailure when there is no user cached', () async {
      when(() => mockUserCacheService.getUser()).thenAnswer((_) async => null);

      final result = await datasource.getPelanggan();

      expect(result, const Left(ParsingFailure('User not found')));
      verify(() => mockUserCacheService.getUser()).called(1);
      verifyNever(() => mockRequest.get(any()));
    });

    group('addReviews', () {
      final tUserModel = UserModel(sub: 1);
      final tReviewsRequest = ReviewsRequest(
          pelangganId: 1, mitraId: 1, rating: 50, komentar: 'Good');
      final tReviewsRequestResponse = ReviewsRequest(
          pelangganId: 1, mitraId: 1, rating: 50, komentar: 'Good');

      test('should return ParsingFailure when there is no user cached',
          () async {
        when(() => mockUserCacheService.getUser())
            .thenAnswer((_) async => null);

        final result = await datasource.addReviews(
            reviewsRequest: tReviewsRequest, mitraId: 1);

        expect(result, const Left(ParsingFailure('User not found')));
        verify(() => mockUserCacheService.getUser()).called(1);
        verifyNever(() => mockRequest.put(any(), data: any(named: 'data')));
      });
    });
  });
}
