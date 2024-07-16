import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/models/queue_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class QueueRepository {
  Future<Either<Failure, List<QueueListModel>>> getQueue(
      {required int mitraId});
}
