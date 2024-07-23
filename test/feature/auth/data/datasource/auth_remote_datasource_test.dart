import 'dart:convert';
import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/login_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixture/fixture.dart';

class MockRequest extends Mock implements Request {}

class MockUserServices extends Mock implements UserCacheService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockRequest mockRequest;
  late MockUserServices mockUserServices;
  late AuthRemoteDatasource authRemoteDatasource;

  setUpAll(
    () {
      mockRequest = MockRequest();
      mockUserServices = MockUserServices();
      serviceLocator.registerFactory<Request>(() => mockRequest);
      serviceLocator.registerFactory<UserCacheService>(() => mockUserServices);
      authRemoteDatasource = AuthRemoteDatasourceImpl();
    },
  );

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  // Login
  final LoginResponse loginResponse = LoginResponse.fromJson(
    jsonDecode(
      fixture('accessToken_response.json'),
    ),
  );

  test('Mengembalikan response access token ketika berhasil login', () async {
    when(
      () => mockRequest.post(
        any(),
        data: any(named: 'data'),
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 200,
        data: loginResponse.toJson(),
        requestOptions: RequestOptions(baseUrl: '', path: ''),
      ),
    );
    when(
      () => mockUserServices.saveAccessToken(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXJuYW1lIjoicm92aW5vIiwicm9sZSI6InBlbGFuZ2dhbiIsInBpY3R1cmUiOiJmZWE4NjQwMi0wOTRjLTQyYzItYjc5MS0xNDlhZTAyY2Y1YzkuanBnIiwiZW1haWwiOiJyb3Zpbm9AdmVybmkueXQiLCJpYXQiOjE3MjE1ODI2NTYsImV4cCI6MTcyMTY2OTA1Nn0.twfyE9iTdR76gbvKb5hpDpYWLfiBNObS90klDjiK26Q',
      ),
    ).thenAnswer((_) async => Future<void>.value());
    when(
      () => mockUserServices.setToken(
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXJuYW1lIjoicm92aW5vIiwicm9sZSI6InBlbGFuZ2dhbiIsInBpY3R1cmUiOiJmZWE4NjQwMi0wOTRjLTQyYzItYjc5MS0xNDlhZTAyY2Y1YzkuanBnIiwiZW1haWwiOiJyb3Zpbm9AdmVybmkueXQiLCJpYXQiOjE3MjE1ODI2NTYsImV4cCI6MTcyMTY2OTA1Nn0.twfyE9iTdR76gbvKb5hpDpYWLfiBNObS90klDjiK26Q',
      ),
    ).thenAnswer((_) async => Future<void>.value());

    final result = await authRemoteDatasource.loginUser(
      user: LoginRequest.fromJson(const {
        "username": "rovino",
        "password": "rovino11223344",
      }),
    );

    expect(result, Right(loginResponse));
  });

  test('Mengembalikan message connection failure ketika gagal login', () async {
    const String message = 'Unable to connect';
    when(
      () => mockRequest.post(
        any(),
        data: any(named: 'data'),
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 400,
        data: {'message': message},
        requestOptions: RequestOptions(
          baseUrl: '',
          path: '',
        ),
      ),
    );

    final result = await authRemoteDatasource.loginUser(
        user: LoginRequest.fromJson(const {}));
    expect(
      result,
      const Left(
        ConnectionFailure(message),
      ),
    );
  });

  // Register
  final RegisterResponse response = RegisterResponse.fromJson(
    jsonDecode(
      fixture('register_response.json'),
    ),
  );

  test('Mengembalikan response register model', () async {
    when(
      () => mockRequest.post(
        any(),
        data: any(named: 'data'),
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 201,
        data: response.toJson(),
        requestOptions: RequestOptions(baseUrl: '', path: ''),
      ),
    );
    final result = await authRemoteDatasource.registerUser(
        requestUser: RegisterRequest.fromJson(const {}));
    expect(result, Right(response));
  });

  test('Mengembalikan message connection failure ketika gagal register',
      () async {
    const String message = 'Unable to connect';
    when(
      () => mockRequest.post(
        any(),
        data: any(named: 'data'),
      ),
    ).thenAnswer(
      (_) async => Response(
        statusCode: 400,
        data: {'message': message},
        requestOptions: RequestOptions(
          baseUrl: '',
          path: '',
        ),
      ),
    );

    final result = await authRemoteDatasource.registerUser(
        requestUser: RegisterRequest.fromJson(const {}));
    expect(
      result,
      const Left(
        ConnectionFailure(message),
      ),
    );
  });
}
