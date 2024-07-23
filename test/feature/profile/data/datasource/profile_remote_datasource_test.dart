import 'dart:convert';
import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixture/fixture.dart';

class MockRequest extends Mock implements Request {}

class MockUserServices extends Mock implements UserCacheService {}

void main() {
  late MockRequest mockRequest;
  late MockUserServices mockUserServices;
  late ProfileUserDatasource profileUserDatasource;

  setUpAll(() {
    mockRequest = MockRequest();
    mockUserServices = MockUserServices();
    serviceLocator.registerFactory<Request>(() => mockRequest);
    serviceLocator.registerFactory<UserCacheService>(() => mockUserServices);
    profileUserDatasource = ProfileUserDatasourceImpl();
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  group('Get User Profile', () {
    final pelangganJson = fixture('pelanggan_response.json');
    final PelangganModel pelangganModel =
        PelangganModel.fromJson(jsonDecode(pelangganJson));

    test('should return PelangganModel when the response is successful',
        () async {
      print('Fixture Data: $pelangganJson');
      when(() => mockUserServices.getUser())
          .thenAnswer((_) async => UserModel(sub: 5));
      when(() => mockRequest.get(any())).thenAnswer((_) async => Response(
            data: pelangganModel.toJson(),
            statusCode: 200,
            requestOptions: RequestOptions(
              baseUrl: '',
              path: '',
            ),
          ));

      final result = await profileUserDatasource.getPelanggan();
      print('API Call Result: $result');
      expect(result, Right(pelangganModel));
    });

    test(
      'should return connection failure when the response code is not 200',
      () async {
        const String message = 'Unable to connect';
        when(() => mockUserServices.getUser())
            .thenAnswer((_) async => UserModel(sub: 5));
        when(
          () => mockRequest.get(
            any(),
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

        final result = await profileUserDatasource.getPelanggan();

        expect(
          result,
          equals(Left(ConnectionFailure(message))),
        );
      },
    );

    test(
      'should return parsing failure if there is a parsing error',
      () async {
        // arrange
        when(() => mockUserServices.getUser())
            .thenAnswer((_) async => UserModel());
        when(
          () => mockRequest.get(
            any(),
          ),
        ).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: {}, // Invalid data format
            requestOptions: RequestOptions(
              baseUrl: '',
              path: '',
            ),
          ),
        );

        // act
        final result = await profileUserDatasource.getPelanggan();

        // assert
        expect(
          result,
          equals(Left<ParsingFailure, PelangganModel>(
            ParsingFailure('Unable to parse the response'),
          )),
        );
      },
    );

    test(
      'should return parsing failure if user not found',
      () async {
        // arrange
        when(() => mockUserServices.getUser()).thenAnswer((_) async => null);

        // act
        final result = await profileUserDatasource.getPelanggan();
        // assert
        expect(
          result,
          equals(const Left(ParsingFailure('User not found'))),
        );
      },
    );
  });
}
