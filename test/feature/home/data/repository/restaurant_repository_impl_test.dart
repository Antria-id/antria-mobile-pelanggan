import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/home/data/datasources/restaurant_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/home/data/repositories/restaurant_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for RestaurantRemoteDatasource
class MockRestaurantRemoteDatasource extends Mock
    implements RestaurantRemoteDatasource {}

void main() {
  late RestaurantRepositoryImpl repository;
  late MockRestaurantRemoteDatasource mockRestaurantRemoteDatasource;

  setUpAll(() {
    mockRestaurantRemoteDatasource = MockRestaurantRemoteDatasource();
    // Register the mock datasource with the service locator
    serviceLocator.registerLazySingleton<RestaurantRemoteDatasource>(
        () => mockRestaurantRemoteDatasource);
    repository = RestaurantRepositoryImpl();
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  final tRestaurantList = [
    GetRestaurantResponse(
      review: 5,
      id: 1,
      namaToko: "Restaurant A",
      deskripsiToko: "Description of Restaurant A",
      alamat: "123 Main Street",
      hariBuka: "Monday-Friday",
      jamBuka: "08:00",
      jamTutup: "22:00",
      gambarToko: "image_url",
      createdAt: DateTime.parse("2023-07-21T14:11:00.000Z"),
      updatedAt: DateTime.parse("2023-07-22T14:11:00.000Z"),
    ),
  ];

  test(
      'should return a list of GetRestaurantResponse when the call to remote data source is successful',
      () async {
    // Arrange
    when(() => mockRestaurantRemoteDatasource.getRestaurant())
        .thenAnswer((_) async => Right(tRestaurantList));

    // Act
    final result = await repository.getRestaurant();

    // Assert
    expect(result, Right(tRestaurantList));
    verify(() => mockRestaurantRemoteDatasource.getRestaurant());
    verifyNoMoreInteractions(mockRestaurantRemoteDatasource);
  });

  test(
      'should return Failure when the call to remote data source is unsuccessful',
      () async {
    // Arrange
    final tFailure = ConnectionFailure('');
    when(() => mockRestaurantRemoteDatasource.getRestaurant())
        .thenAnswer((_) async => Left(tFailure));

    // Act
    final result = await repository.getRestaurant();

    // Assert
    expect(result, Left(tFailure));
    verify(() => mockRestaurantRemoteDatasource.getRestaurant());
    verifyNoMoreInteractions(mockRestaurantRemoteDatasource);
  });
}
