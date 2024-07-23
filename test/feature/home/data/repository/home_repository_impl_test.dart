import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/home/data/datasources/home_local_datasource.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/home/data/repositories/home_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Mock class for HomeLocalUserDatasource
class MockHomeLocalUserDatasource extends Mock
    implements HomeLocalUserDatasource {}

void main() {
  late HomeRepositoryImpl repository;
  late MockHomeLocalUserDatasource mockHomeLocalUserDatasource;

  setUpAll(() {
    mockHomeLocalUserDatasource = MockHomeLocalUserDatasource();
    // Register the mock datasource with the service locator
    serviceLocator.registerLazySingleton<HomeLocalUserDatasource>(
        () => mockHomeLocalUserDatasource);
    repository = HomeRepositoryImpl();
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  final tUserModel = UserModel(
      sub: 1,
      username: "testuser",
      role: "admin",
      iat: 1617181718,
      exp: 1617181818);

  test(
      'should return UserModel when the call to local data source is successful',
      () async {
    // Arrange
    when(() => mockHomeLocalUserDatasource.getUserFromLocalStorage())
        .thenAnswer((_) async => Right(tUserModel));

    // Act
    final result = await repository.getUserFromLocalStorage();

    // Assert
    expect(result, Right(tUserModel));
    verify(() => mockHomeLocalUserDatasource.getUserFromLocalStorage());
    verifyNoMoreInteractions(mockHomeLocalUserDatasource);
  });

  test(
      'should return Failure when the call to local data source is unsuccessful',
      () async {
    // Arrange
    final tFailure = ParsingFailure('');
    when(() => mockHomeLocalUserDatasource.getUserFromLocalStorage())
        .thenAnswer((_) async => Left(tFailure));

    // Act
    final result = await repository.getUserFromLocalStorage();

    // Assert
    expect(result, Left(tFailure));
    verify(() => mockHomeLocalUserDatasource.getUserFromLocalStorage());
    verifyNoMoreInteractions(mockHomeLocalUserDatasource);
  });
}
