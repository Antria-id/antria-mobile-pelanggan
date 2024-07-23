import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/done_order/history_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/usecases/done_order/get_detail_transaction_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get_it/get_it.dart';

class MockHistoryTransactionRemoteDatasource extends Mock
    implements HistoryTransactionRemoteDatasource {}

void main() {
  final getIt = GetIt.instance;

  late MockHistoryTransactionRemoteDatasource mockDatasource;
  late GetDetailTransactionUsecase usecase;

  setUp(() {
    getIt.reset();
    mockDatasource = MockHistoryTransactionRemoteDatasource();
    getIt.registerSingleton<HistoryTransactionRemoteDatasource>(mockDatasource);
    usecase = GetDetailTransactionUsecase();
  });

  const String invoice = 'test_invoice';
  final DetailTransactionModel testDetailTransaction = DetailTransactionModel(
      // Add the necessary fields for your DetailTransactionModel here
      );

  test(
      'should return DetailTransactionModel when the call to datasource is successful',
      () async {
    // arrange
    when(() => mockDatasource.getDetailOrder(invoice: invoice))
        .thenAnswer((_) async => Right(testDetailTransaction));
    // act
    final result = await usecase.getDetailOrder(invoice: invoice);
    // assert
    expect(result, Right(testDetailTransaction));
    verify(() => mockDatasource.getDetailOrder(invoice: invoice)).called(1);
    verifyNoMoreInteractions(mockDatasource);
  });

  test('should return Failure when the call to datasource is unsuccessful',
      () async {
    // arrange
    final failure = ConnectionFailure('');
    when(() => mockDatasource.getDetailOrder(invoice: invoice))
        .thenAnswer((_) async => Left(failure));
    // act
    final result = await usecase.getDetailOrder(invoice: invoice);
    // assert
    expect(result, Left(failure));
    verify(() => mockDatasource.getDetailOrder(invoice: invoice)).called(1);
    verifyNoMoreInteractions(mockDatasource);
  });
}
