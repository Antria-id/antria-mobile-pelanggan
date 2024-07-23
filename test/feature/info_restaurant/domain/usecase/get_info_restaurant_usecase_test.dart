import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/info_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/repositories/info_restaurant_repository.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/domain/usecases/info_restaurant/get_info_restaurant_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Create a Mock class for InfoRestaurantRepository
class MockInfoRestaurantRepository extends Mock
    implements InfoRestaurantRepository {}

void main() {
  late GetInfoRestaurantUsecase getInfoRestaurantUsecase;
  late MockInfoRestaurantRepository mockInfoRestaurantRepository;

  setUp(() {
    mockInfoRestaurantRepository = MockInfoRestaurantRepository();
    getInfoRestaurantUsecase = GetInfoRestaurantUsecase();

    // Register the mock repository with the service locator
    serviceLocator.registerLazySingleton<InfoRestaurantRepository>(
        () => mockInfoRestaurantRepository);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  final int testMitraId = 1;
  final GetInfoRestaurantResponse testResponse = GetInfoRestaurantResponse(
      // Initialize with appropriate test data
      );

  test(
      'should return info restaurant data when the call to repository is successful',
      () async {
    // arrange
    when(() => mockInfoRestaurantRepository.getInfoRestaurant(any()))
        .thenAnswer((_) async => Right(testResponse));

    // act
    final result =
        await getInfoRestaurantUsecase.getInfoRestaurant(testMitraId);

    // assert
    expect(result, Right(testResponse));
    verify(() => mockInfoRestaurantRepository.getInfoRestaurant(testMitraId));
    verifyNoMoreInteractions(mockInfoRestaurantRepository);
  });

  test('should return a Failure when the call to repository is unsuccessful',
      () async {
    // arrange
    final failure = ConnectionFailure('Connection Failure');
    when(() => mockInfoRestaurantRepository.getInfoRestaurant(any()))
        .thenAnswer((_) async => Left(failure));

    // act
    final result =
        await getInfoRestaurantUsecase.getInfoRestaurant(testMitraId);

    // assert
    expect(result, Left(failure));
    verify(() => mockInfoRestaurantRepository.getInfoRestaurant(testMitraId));
    verifyNoMoreInteractions(mockInfoRestaurantRepository);
  });
}
