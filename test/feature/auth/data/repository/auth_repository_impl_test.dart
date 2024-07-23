import 'dart:convert';
import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/datasources/auth_local_datasource.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixture/fixture.dart';

class MockRemoteDataSource extends Mock implements AuthRemoteDatasourceImpl {}

class MockAuthLocalDatasource extends Mock implements AuthLocalDatasource {}

void main() {
  late MockAuthLocalDatasource mockAuthLocalDatasource;
  late MockRemoteDataSource mockRemoteDataSource;
  late AuthRepositoryImpl authRepositoryImpl;
  setUpAll(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockAuthLocalDatasource = MockAuthLocalDatasource();
    serviceLocator
        .registerFactory<AuthRemoteDatasource>(() => mockRemoteDataSource);
    serviceLocator
        .registerFactory<AuthLocalDatasource>(() => mockAuthLocalDatasource);
    authRepositoryImpl = AuthRepositoryImpl();
  });
  final LoginResponse user = LoginResponse.fromJson(jsonDecode(
    fixture('accessToken_response.json'),
  ));

  test(
    'should return AccessToken object on successful login',
    () async {
      //arrange
      when(() => mockRemoteDataSource.loginUser(
            user: LoginRequest.fromJson(const {
              "username": "rovino",
              "password": "rovino11223344",
            }),
          )).thenAnswer(
        (_) async => Right(user),
      );
      // act
      final response = await authRepositoryImpl.loginUser(
        user: LoginRequest.fromJson(const {
          "username": "rovino",
          "password": "rovino11223344",
        }),
      );
      // assert
      expect(response, Right(user));
    },
  );
  test(
    'should return Failure object on login fail',
    () async {
      //arrange
      when(() => mockRemoteDataSource.loginUser(
            user: LoginRequest.fromJson(const {
              "username": "rovino",
              "password": "rovino11223344",
            }),
          )).thenAnswer(
        (_) async => const Left(ConnectionFailure('')),
      );
      // act
      final response = await authRepositoryImpl.loginUser(
        user: LoginRequest.fromJson(const {
          "username": "rovino",
          "password": "rovino11223344",
        }),
      );
      // assert
      expect(response, const Left(ConnectionFailure('')));
    },
  );

  //Register
  final RegisterResponse registerResponse = RegisterResponse.fromJson(
    jsonDecode(
      fixture('register_response.json'),
    ),
  );
  test(
    'should return Register object on successful login',
    () async {
      //arrange
      when(
        () => mockRemoteDataSource.registerUser(
          requestUser: RegisterRequest(
            pelangganData: PelangganData(
              username: "rovino",
              password: "rovino11223344",
              email: "rovino@verni.yt",
              nama: "rovinos",
            ),
          ),
        ),
      ).thenAnswer(
        (_) async => Right(registerResponse),
      );
      // act
      final response = await authRepositoryImpl.registerUser(
        requestUser: RegisterRequest.fromJson(
          const {
            "pelangganData": {
              "username": "rovino",
              "password": "rovino11223344",
              "email": "rovino@verni.yt",
              "nama": "rovinos"
            }
          },
        ),
      );
      // assert
      expect(response, Right(registerResponse));
    },
  );
  test(
    'should return Failure object on login fail',
    () async {
      //arrange
      when(() => mockRemoteDataSource.registerUser(
            requestUser: RegisterRequest(
                pelangganData: PelangganData(
              username: "rovino",
              password: "rovino11223344",
              email: "rovino@verni.yt",
              nama: "rovinos",
            )),
          )).thenAnswer(
        (_) async => const Left(ConnectionFailure('')),
      );
      // act
      final response = await authRepositoryImpl.registerUser(
        requestUser: RegisterRequest.fromJson(
          const {
            "pelangganData": {
              "username": "rovino",
              "password": "rovino11223344",
              "email": "rovino@verni.yt",
              "nama": "rovinos"
            }
          },
        ),
      );
      // assert
      expect(response, const Left(ConnectionFailure('')));
    },
  );
  test(
    'should return Right when deletion from local storage is successful',
    () async {
      // Arrange
      when(() => mockAuthLocalDatasource.deleteUserFromLocalStorage())
          .thenAnswer((_) async => const Right(null));

      // Act
      final result = await authRepositoryImpl.deleteUserFromLocalStorage();

      // Assert
      expect(result, const Right(null));
      verify(() => mockAuthLocalDatasource.deleteUserFromLocalStorage())
          .called(1);
    },
  );

  test(
    'should return Left with Failure when deletion from local storage is unsuccessful',
    () async {
      // Arrange
      final tFailure = ParsingFailure('Failed Delete user');
      when(() => mockAuthLocalDatasource.deleteUserFromLocalStorage())
          .thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await authRepositoryImpl.deleteUserFromLocalStorage();

      // Assert
      expect(result, Left(tFailure));
      verify(() => mockAuthLocalDatasource.deleteUserFromLocalStorage())
          .called(1);
    },
  );
}
