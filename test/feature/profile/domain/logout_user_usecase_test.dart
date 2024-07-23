import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';
import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/repositories/pelanggan_repository.dart';
import 'package:antria_mobile_pelanggan/features/profile/domain/usecases/logout_user_usecase.dart';

class MockProfileRepository extends Mock implements ProfileRepository {}

class MockRequest extends Mock implements Request {}

void main() {
  late MockProfileRepository mockProfileRepository;
  late MockRequest mockRequest;
  late LogoutUserUsecase logoutUserUsecase;

  setUpAll(() {
    registerFallbackValue(ConnectionFailure(''));
  });

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    mockRequest = MockRequest();

    serviceLocator
        .registerLazySingleton<ProfileRepository>(() => mockProfileRepository);
    serviceLocator.registerLazySingleton<Request>(() => mockRequest);

    logoutUserUsecase = LogoutUserUsecase();
  });

  tearDown(() {
    serviceLocator.reset();
  });

  test('should delete user from local storage and clear authorization',
      () async {
    // Arrange
    when(() => mockProfileRepository.deleteUserFromLocalStorage())
        .thenAnswer((_) async => Right(null));

    // Act
    final result = await logoutUserUsecase.deleteUserFromLocalStorage();

    // Assert
    expect(result, Right(null));
    verify(() => mockProfileRepository.deleteUserFromLocalStorage()).called(1);
    verify(() => mockRequest.clearAuthorization()).called(1);
  });

  test('should return Failure when delete user from local storage fails',
      () async {
    // Arrange
    final failure = ConnectionFailure('');
    when(() => mockProfileRepository.deleteUserFromLocalStorage())
        .thenAnswer((_) async => Left(failure));

    // Act
    final result = await logoutUserUsecase.deleteUserFromLocalStorage();

    // Assert
    expect(result, Left(failure));
    verify(() => mockProfileRepository.deleteUserFromLocalStorage()).called(1);
    verifyNever(() => mockRequest.clearAuthorization());
  });
}
