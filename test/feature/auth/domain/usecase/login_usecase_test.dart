import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/repositories/auth_repository.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/login/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

class MockRequest extends Mock implements Request {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late MockRequest mockRequest;
  late LoginUsecase loginUsecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockRequest = MockRequest();
    loginUsecase = LoginUsecase();

    // Register the mocks in the service locator
    serviceLocator.registerSingleton<AuthRepository>(mockAuthRepository);
    serviceLocator.registerSingleton<Request>(mockRequest);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  final tLoginRequest = LoginRequest(username: 'test', password: 'test');
  final tLoginResponse = LoginResponse(accessToken: 'token');

  test('should return Right with LoginResponse when login is successful',
      () async {
    // Arrange
    when(() => mockAuthRepository.loginUser(user: tLoginRequest))
        .thenAnswer((_) async => Right(tLoginResponse));

    // Act
    final result = await loginUsecase.loginUser(tLoginRequest);

    // Assert
    expect(result, Right(tLoginResponse));
    verify(() => mockAuthRepository.loginUser(user: tLoginRequest)).called(1);
    verify(() => mockRequest.updateAuthorization('token')).called(1);
  });

  test('should return Left with Failure when login is unsuccessful', () async {
    // Arrange
    final tFailure = ParsingFailure('Failed Login');
    when(() => mockAuthRepository.loginUser(user: tLoginRequest))
        .thenAnswer((_) async => Left(tFailure));

    // Act
    final result = await loginUsecase.loginUser(tLoginRequest);

    // Assert
    expect(result, Left(tFailure));
    verify(() => mockAuthRepository.loginUser(user: tLoginRequest)).called(1);
    verifyNever(() => mockRequest.updateAuthorization(any()));
  });
}
