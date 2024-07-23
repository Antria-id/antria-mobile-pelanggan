import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/usecases/home/get_local_user_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/home/domain/repositories/home_repository/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late GetLocalUserUsecase usecase;
  late MockHomeRepository mockHomeRepository;

  setUpAll(() {
    mockHomeRepository = MockHomeRepository();
    usecase = GetLocalUserUsecase();
    serviceLocator
        .registerLazySingleton<HomeRepository>(() => mockHomeRepository);
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  final tUserModel = UserModel(
    sub: 1,
    username: "testuser",
    role: "admin",
    iat: 1234567890,
    exp: 1234567890,
  );

  test(
      'should return UserModel from local storage when there is one in the cache',
      () async {
    // arrange
    when(() => mockHomeRepository.getUserFromLocalStorage())
        .thenAnswer((_) async => Right(tUserModel));

    // act
    final result = await usecase.getUserFromLocalStorage();

    // assert
    expect(result, Right(tUserModel));
    verify(() => mockHomeRepository.getUserFromLocalStorage());
    verifyNoMoreInteractions(mockHomeRepository);
  });

  test('should return Failure when there is no cached data present', () async {
    // arrange
    when(() => mockHomeRepository.getUserFromLocalStorage())
        .thenAnswer((_) async => Left(ConnectionFailure('')));

    // act
    final result = await usecase.getUserFromLocalStorage();

    // assert
    expect(result, Left(ConnectionFailure('')));
    verify(() => mockHomeRepository.getUserFromLocalStorage());
    verifyNoMoreInteractions(mockHomeRepository);
  });
}
