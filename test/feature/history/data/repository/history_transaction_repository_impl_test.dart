import 'dart:convert';

import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/done_order/history_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/history_transaction_response.dart';
import 'package:antria_mobile_pelanggan/features/history/data/repositories/history_transaction_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixture/fixture.dart';

class MockHistoryTransactionRemoteDatasource extends Mock
    implements HistoryTransactionRemoteDatasource {}

void main() {
  late HistoryTransactionRepositoryImpl historyTransactionRepositoryImpl;
  late MockHistoryTransactionRemoteDatasource mockDatasource;

  setUpAll(() {
    mockDatasource = MockHistoryTransactionRemoteDatasource();
    serviceLocator.registerFactory<HistoryTransactionRemoteDatasource>(
        () => mockDatasource);
    historyTransactionRepositoryImpl = HistoryTransactionRepositoryImpl();
  });

  tearDown(() {
    reset(mockDatasource);
  });

  final List<dynamic> jsonList =
      jsonDecode(fixture('history_transaction_response.json'));

  final List<HistoryTransactionResponse> transaksiResponseList = jsonList
      .map((jsonItem) => HistoryTransactionResponse.fromJson(jsonItem))
      .toList();

  final DetailTransactionModel detailTransactionModel =
      DetailTransactionModel.fromJson(
          jsonDecode(fixture('detail_transaksi.json')));

  group('getHistoryOrder', () {
    test(
        'should return list of HistoryTransactionResponse when call to datasource is successful',
        () async {
      // arrange
      when(() => mockDatasource.getHistoryOrder())
          .thenAnswer((_) async => Right(transaksiResponseList));

      // act
      final result = await historyTransactionRepositoryImpl.getHistoryOrder();

      // assert
      verify(() => mockDatasource.getHistoryOrder()).called(1);
      expect(result, equals(Right(transaksiResponseList)));
    });

    test('should return Failure when call to datasource is unsuccessful',
        () async {
      // arrange
      when(() => mockDatasource.getHistoryOrder())
          .thenAnswer((_) async => Left(ParsingFailure("Error fetch data")));

      // act
      final result = await historyTransactionRepositoryImpl.getHistoryOrder();

      // assert
      verify(() => mockDatasource.getHistoryOrder()).called(1);
      expect(result, equals(Left(ParsingFailure("Error fetch data"))));
    });
  });

  group('getDetailOrder', () {
    test(
        'should return DetailTransactionModel when call to datasource is successful',
        () async {
      // arrange
      when(() => mockDatasource.getDetailOrder(invoice: 'INVC1716358907'))
          .thenAnswer((_) async => Right(detailTransactionModel));

      // act
      final result = await historyTransactionRepositoryImpl.getDetailOrder(
          invoice: 'INVC1716358907');

      // assert
      verify(() => mockDatasource.getDetailOrder(invoice: 'INVC1716358907'))
          .called(1);
      expect(result, equals(Right(detailTransactionModel)));
    });

    test('should return Failure when call to datasource is unsuccessful',
        () async {
      // arrange
      when(() => mockDatasource.getDetailOrder(invoice: 'INVC1716358907'))
          .thenAnswer((_) async => Left(ParsingFailure("Error fetch data")));

      // act
      final result = await historyTransactionRepositoryImpl.getDetailOrder(
          invoice: 'INVC1716358907');

      // assert
      verify(() => mockDatasource.getDetailOrder(invoice: 'INVC1716358907'))
          .called(1);
      expect(result, equals(Left(ParsingFailure("Error fetch data"))));
    });
  });
}

class ParsingFailure extends Failure {
  final String message;
  ParsingFailure(this.message) : super('');
}
