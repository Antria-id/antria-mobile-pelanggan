import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/repositories/auth_repository.dart';
import 'package:antria_mobile_pelanggan/features/auth/domain/usecases/register/register_ucecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late RegisterUsecase registerUsecase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    registerUsecase = RegisterUsecase();

    // Register the mock in the service locator
    serviceLocator.registerSingleton<AuthRepository>(mockAuthRepository);
  });

  tearDown(() {
    serviceLocator.reset();
  });

  final tRegisterRequest = RegisterRequest(
    username: "Verniyt",
    password: "verniyt11223344",
    email: "hibikiverniy@gmail.com",
    nama: "Verniyt",
  );
  final tRegisterResponse = RegisterResponse(
    pelanggan: Pelanggan(
      id: 6,
      username: "Verniyt",
      password: "verniyt11223344",
      email: "hibikiverniy@gmail.com",
      emailVerified: false,
      profilePicture: "",
      nama: "Verniyt",
      handphone: "",
      alamat: "",
      wallet: 0,
      createdAt: DateTime.parse("2024-05-06T10:28:52.622Z"),
      updatedAt: DateTime.parse("2024-05-06T10:28:52.622Z"),
    ),
  );

  test(
      'should return Right with RegisterResponse when registration is successful',
      () async {
    // Arrange
    when(() => mockAuthRepository.registerUser(requestUser: tRegisterRequest))
        .thenAnswer((_) async => Right(tRegisterResponse));

    // Act
    final result = await registerUsecase.registerUser(tRegisterRequest);

    // Assert
    expect(result, Right(tRegisterResponse));
    verify(() => mockAuthRepository.registerUser(requestUser: tRegisterRequest))
        .called(1);
  });

  test('should return Left with Failure when registration is unsuccessful',
      () async {
    // Arrange
    final tFailure = ParsingFailure('Failed Register');
    when(() => mockAuthRepository.registerUser(requestUser: tRegisterRequest))
        .thenAnswer((_) async => Left(tFailure));

    // Act
    final result = await registerUsecase.registerUser(tRegisterRequest);

    // Assert
    expect(result, Left(tFailure));
    verify(() => mockAuthRepository.registerUser(requestUser: tRegisterRequest))
        .called(1);
  });
}
