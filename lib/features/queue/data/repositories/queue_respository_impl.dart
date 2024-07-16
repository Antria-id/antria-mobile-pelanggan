import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/datasources/queue_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/models/queue_list_model.dart';
import 'package:antria_mobile_pelanggan/features/queue/domain/repositories/queue_repository.dart';
import 'package:dartz/dartz.dart';

class QueueRepositoryImpl extends QueueRepository {
  @override
  Future<Either<Failure, List<QueueListModel>>> getQueue(
      {required int mitraId}) {
    return serviceLocator<QueueRemoteDatasource>().getQueue(
      mitraId: mitraId,
    );
  }
}
