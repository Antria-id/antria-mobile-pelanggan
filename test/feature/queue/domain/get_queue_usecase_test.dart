import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/datasources/queue_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/models/queue_list_model.dart';
import 'package:antria_mobile_pelanggan/features/queue/domain/usecases/get_queue_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockQueueRemoteDatasource extends Mock implements QueueRemoteDatasource {}

void main() {
  late GetQueueUsecase usecase;
  late MockQueueRemoteDatasource mockQueueRemoteDatasource;

  setUpAll(() {
    mockQueueRemoteDatasource = MockQueueRemoteDatasource();
    serviceLocator.registerLazySingleton<QueueRemoteDatasource>(
        () => mockQueueRemoteDatasource);
    usecase = GetQueueUsecase();
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  final int tMitraId = 1;
  final List<QueueListModel> tQueueList = [
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
    'should get list of queues from the remote data source',
    () async {
      // arrange
      when(() => mockQueueRemoteDatasource.getQueue(
              mitraId: any(named: 'mitraId')))
          .thenAnswer((_) async => Right(tQueueList));

      // act
      final result = await usecase.getQueue(mitraId: tMitraId);

      // assert
      expect(result, Right(tQueueList));
      verify(() => mockQueueRemoteDatasource.getQueue(mitraId: tMitraId));
      verifyNoMoreInteractions(mockQueueRemoteDatasource);
    },
  );

  test(
    'should return Failure when the call to remote data source is unsuccessful',
    () async {
      // arrange
      when(() => mockQueueRemoteDatasource.getQueue(
              mitraId: any(named: 'mitraId')))
          .thenAnswer((_) async => Left(ConnectionFailure('')));

      // act
      final result = await usecase.getQueue(mitraId: tMitraId);

      // assert
      expect(result, Left(ConnectionFailure('')));
      verify(() => mockQueueRemoteDatasource.getQueue(mitraId: tMitraId));
      verifyNoMoreInteractions(mockQueueRemoteDatasource);
    },
  );
}
