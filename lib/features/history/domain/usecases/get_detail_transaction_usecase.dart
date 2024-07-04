import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/history_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/detail_transaction_model.dart';
import 'package:dartz/dartz.dart';

class GetDetailTransactionUsecase {
  Future<Either<Failure, DetailTransactionModel>> getDetailOrder(
      {required String invoice}) {
    return serviceLocator<HistoryTransactionRemoteDatasource>()
        .getDetailOrder(invoice: invoice);
  }
}
