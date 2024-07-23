import 'dart:convert';
import 'dart:io';

import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/done_order/history_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/history_transaction_response.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/usecases/done_order/get_history_transaction_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Create a Mock class for HistoryTransactionRemoteDatasource
class MockHistoryTransactionRemoteDatasource extends Mock
    implements HistoryTransactionRemoteDatasource {}

void main() {
  late GetHistoryTransactionUsecase usecase;
  late MockHistoryTransactionRemoteDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockHistoryTransactionRemoteDatasource();
    serviceLocator.reset();
    serviceLocator.registerLazySingleton<HistoryTransactionRemoteDatasource>(
        () => mockDatasource);
    usecase = GetHistoryTransactionUsecase();
  });

  // Helper function to load fixture
  String fixture(String name) => File('test/fixtures/$name').readAsStringSync();

  // Parse fixture JSON to list of HistoryTransactionResponse
  final List<dynamic> jsonMap =
      json.decode(fixture('history_response_model.json'));
  final tHistoryTransactionResponse =
      jsonMap.map((json) => HistoryTransactionResponse.fromJson(json)).toList();

  test('should get history orders from the remote datasource', () async {
    // arrange
    when(() => mockDatasource.getHistoryOrder())
        .thenAnswer((_) async => Right(tHistoryTransactionResponse));

    // act
    final result = await usecase.getHistoryOrder();

    // assert
    expect(result, Right(tHistoryTransactionResponse));
    verify(() => mockDatasource.getHistoryOrder()).called(1);
    verifyNoMoreInteractions(mockDatasource);
  });

  test('should return a failure when there is an error', () async {
    // arrange
    final tFailure = ConnectionFailure('Server Error');
    when(() => mockDatasource.getHistoryOrder())
        .thenAnswer((_) async => Left(tFailure));

    // act
    final result = await usecase.getHistoryOrder();

    // assert
    expect(result, Left(tFailure));
    verify(() => mockDatasource.getHistoryOrder()).called(1);
    verifyNoMoreInteractions(mockDatasource);
  });
}
