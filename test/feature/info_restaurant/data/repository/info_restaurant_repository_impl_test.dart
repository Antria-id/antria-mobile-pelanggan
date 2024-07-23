import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/info_restaurant/inforestaurant_remote_datasources.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/info_restaurant_model.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/repositories/info_restaurant_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockInfoRestaurantRemoteDatasource extends Mock
    implements InfoRestaurantRemoteDatasource {}

void main() {
  late InfoRestaurantRepositoryImpl repository;
  late MockInfoRestaurantRemoteDatasource mockRemoteDatasource;

  setUpAll(() {
    mockRemoteDatasource = MockInfoRestaurantRemoteDatasource();
    repository = InfoRestaurantRepositoryImpl();
    serviceLocator.registerSingleton<InfoRestaurantRemoteDatasource>(
        mockRemoteDatasource);
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  const mitraId = 1;
  final tInfoRestaurantResponse = GetInfoRestaurantResponse(
      // Populate this with actual data structure
      );

  test(
      'should return GetInfoRestaurantResponse when the call to remote data source is successful',
      () async {
    // arrange
    when(() => mockRemoteDatasource.getInfoRestaurant(mitraId))
        .thenAnswer((_) async => Right(tInfoRestaurantResponse));
    // act
    final result = await repository.getInfoRestaurant(mitraId);
    // assert
    expect(result, Right(tInfoRestaurantResponse));
    verify(() => mockRemoteDatasource.getInfoRestaurant(mitraId)).called(1);
  });

  test(
      'should return Failure when the call to remote data source is unsuccessful',
      () async {
    // arrange
    when(() => mockRemoteDatasource.getInfoRestaurant(mitraId))
        .thenAnswer((_) async => Left(ConnectionFailure('')));
    // act
    final result = await repository.getInfoRestaurant(mitraId);
    // assert
    expect(result, Left(ConnectionFailure('')));
    verify(() => mockRemoteDatasource.getInfoRestaurant(mitraId)).called(1);
  });
}
