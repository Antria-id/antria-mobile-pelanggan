import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/datasources/queue_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/models/queue_list_model.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/repositories/queue_respository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:get_it/get_it.dart';

class MockQueueRemoteDatasource extends Mock implements QueueRemoteDatasource {}

void main() {
  late QueueRepositoryImpl repository;
  late MockQueueRemoteDatasource mockRemoteDatasource;
  final sl = GetIt.instance;

  setUpAll(() {
    mockRemoteDatasource = MockQueueRemoteDatasource();
    sl.registerSingleton<QueueRemoteDatasource>(mockRemoteDatasource);
    repository = QueueRepositoryImpl();
  });

  tearDownAll(() async {
    await sl.reset(dispose: true);
  });

  group('getQueue', () {
    final tMitraId = 1;
    final tQueueListModel = [
      QueueListModel(
        id: 1,
        estimasi: 30,
        orderstatus: "WAITING",
        pesananId: "INVCGA1RO2131026032024",
        createdAt: DateTime.parse("2024-05-16T09:37:24.695Z"),
        updatedAt: DateTime.parse("2024-05-16T09:37:24.695Z"),
      ),
      QueueListModel(
        id: 1,
        estimasi: 30,
        orderstatus: "WAITING",
        pesananId: "INVCGA1RO2131026032024",
        createdAt: DateTime.parse("2024-05-16T09:37:24.695Z"),
        updatedAt: DateTime.parse("2024-05-16T09:37:24.695Z"),
      )
    ];

    test(
        'should return list of QueueListModel when the call to remote data source is successful',
        () async {
      // Arrange
      when(() => mockRemoteDatasource.getQueue(mitraId: any(named: 'mitraId')))
          .thenAnswer((_) async => Right(tQueueListModel));

      // Act
      final result = await repository.getQueue(mitraId: tMitraId);

      // Assert
      verify(() => mockRemoteDatasource.getQueue(mitraId: tMitraId)).called(1);
      expect(result, equals(Right(tQueueListModel)));
    });

    test(
        'should return a Failure when the call to remote data source is unsuccessful',
        () async {
      // Arrange
      when(() => mockRemoteDatasource.getQueue(mitraId: any(named: 'mitraId')))
          .thenAnswer((_) async => Left(ConnectionFailure('')));

      // Act
      final result = await repository.getQueue(mitraId: tMitraId);

      // Assert
      verify(() => mockRemoteDatasource.getQueue(mitraId: tMitraId)).called(1);
      expect(result, equals(Left(ConnectionFailure(''))));
    });
  });
}
