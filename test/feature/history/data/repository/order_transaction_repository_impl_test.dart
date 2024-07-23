import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/order_progress/order_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/order_progress/order_transaction_response.dart';
import 'package:antria_mobile_pelanggan/features/history/data/repositories/order_transaction_repository_impl.dart';

class MockOrderTransactionRemoteDatasource extends Mock
    implements OrderTransactionRemoteDatasource {}

void main() {
  late OrderTransactionRepositoryImpl repository;
  late MockOrderTransactionRemoteDatasource mockRemoteDatasource;

  setUpAll(() {
    mockRemoteDatasource = MockOrderTransactionRemoteDatasource();
    repository = OrderTransactionRepositoryImpl();
    // Assuming serviceLocator is a global function to provide instances
    serviceLocator.registerSingleton<OrderTransactionRemoteDatasource>(
        mockRemoteDatasource);
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });
  group('getProgressOrder', () {
    final tOrderTransactionResponse = <OrderTransactionResponse>[];
    final tFailure = ConnectionFailure(
        'An error occurred'); // Adjust to your actual Failure class

    test('should return a list of OrderTransactionResponse when successful',
        () async {
      // Arrange
      when(() => mockRemoteDatasource.getProgressOrder())
          .thenAnswer((_) async => Right(tOrderTransactionResponse));

      // Act
      final result = await repository.getProgressOrder();

      // Assert
      expect(result, Right(tOrderTransactionResponse));
      verify(() => mockRemoteDatasource.getProgressOrder()).called(1);
      verifyNoMoreInteractions(mockRemoteDatasource);
    });

    test('should return a Failure when an error occurs', () async {
      // Arrange
      when(() => mockRemoteDatasource.getProgressOrder())
          .thenAnswer((_) async => Left(tFailure));

      // Act
      final result = await repository.getProgressOrder();

      // Assert
      expect(result, Left(tFailure));
      verify(() => mockRemoteDatasource.getProgressOrder()).called(1);
      verifyNoMoreInteractions(mockRemoteDatasource);
    });
  });
}
