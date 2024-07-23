import 'dart:convert';
import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/done_order/history_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixture/fixture.dart';

class MockRequest extends Mock implements Request {}

class MockUserServices extends Mock implements UserCacheService {}

void main() {
  late MockRequest mockRequest;
  late MockUserServices mockUserServices;
  late HistoryTransactionRemoteDatasource remoteDatasource;

  setUpAll(() {
    mockRequest = MockRequest();
    mockUserServices = MockUserServices();
    serviceLocator.registerFactory<Request>(() => mockRequest);
    serviceLocator.registerFactory<UserCacheService>(() => mockUserServices);
    remoteDatasource = HistoryTransactionRemoteDatasourceImpl();
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  group('Get Detail Transaksi', () {
    final detailTransactionJson = fixture('pelanggan_response.json');
    final DetailTransactionModel pelangganModel =
        DetailTransactionModel.fromJson(jsonDecode(detailTransactionJson));

    test('should return DetailTransactionModel when the response is successful',
        () async {
      print('Fixture Data: $detailTransactionJson');
      when(() => mockRequest.get(any())).thenAnswer((_) async => Response(
            data: pelangganModel.toJson(),
            statusCode: 200,
            requestOptions: RequestOptions(
              baseUrl: '',
              path: '',
            ),
          ));

      final result = await remoteDatasource.getDetailOrder(
          invoice: "INVCMI2RO21721497626");
      print('API Call Result: $result');
      expect(result, Right(pelangganModel));
    });

    test(
      'should return connection failure when the response code is not 200',
      () async {
        const String message = 'Unable to connect';
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

        final result = await remoteDatasource.getDetailOrder(
            invoice: "INVCMI2RO21721497626");

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
        final result = await remoteDatasource.getDetailOrder(
            invoice: "INVCMI2RO21721497626");

        // assert
        expect(
          result,
          equals(Left<Failure, DetailTransactionModel>(
            ParsingFailure(
                'Unable to parse the response: type \'_Map<dynamic, dynamic>\' is not a subtype of type \'Map<String, dynamic>\''),
          )),
        );
      },
    );
  });

  group('Get List Transaksi', () {
    test(
      'should return parsing failure if user not found',
      () async {
        // arrange
        when(() => mockUserServices.getUser()).thenAnswer((_) async => null);

        // act
        final result = await remoteDatasource.getHistoryOrder();
        // assert
        expect(
          result,
          equals(const Left(ParsingFailure('User not found'))),
        );
      },
    );
  });
}
