import 'package:antria_mobile_pelanggan/features/home/domain/usecases/restaurant/get_restaurant.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/repositories/restaurant_repository/restaurant_repository.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:dartz/dartz.dart';

class MockRestaurantRepository extends Mock implements RestaurantRepository {}

void main() {
  late GetRestaurantUsecase usecase;
  late MockRestaurantRepository mockRestaurantRepository;

  setUp(() {
    serviceLocator.reset();
    mockRestaurantRepository = MockRestaurantRepository();
    serviceLocator
        .registerSingleton<RestaurantRepository>(mockRestaurantRepository);
    usecase = GetRestaurantUsecase();
  });

  final tRestaurants = [
    GetRestaurantResponse(
      review: 5,
      id: 1,
      namaToko: 'Test Restaurant',
      deskripsiToko: 'Description',
      alamat: 'Test Location',
      hariBuka: 'Monday',
      jamBuka: '08:00',
      jamTutup: '22:00',
      gambarToko: 'image_url',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
    GetRestaurantResponse(
      review: 4,
      id: 2,
      namaToko: 'Test Restaurant 2',
      deskripsiToko: 'Description 2',
      alamat: 'Test Location 2',
      hariBuka: 'Tuesday',
      jamBuka: '09:00',
      jamTutup: '23:00',
      gambarToko: 'image_url_2',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ),
  ];

  test('should get list of restaurants from the repository', () async {
    // arrange
    when(() => mockRestaurantRepository.getRestaurant())
        .thenAnswer((_) async => Right(tRestaurants));

    // act
    final result = await usecase.getRestaurant();

    // assert
    expect(result, Right(tRestaurants));
    verify(() => mockRestaurantRepository.getRestaurant()).called(1);
    verifyNoMoreInteractions(mockRestaurantRepository);
  });

  test('should return failure when the call to repository is unsuccessful',
      () async {
    // arrange
    final tFailure = ParsingFailure('Error');
    when(() => mockRestaurantRepository.getRestaurant())
        .thenAnswer((_) async => Left(tFailure));

    // act
    final result = await usecase.getRestaurant();

    // assert
    expect(result, Left(tFailure));
    verify(() => mockRestaurantRepository.getRestaurant()).called(1);
    verifyNoMoreInteractions(mockRestaurantRepository);
  });
}
