import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/done_order/history_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/history_transaction_response.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/repositories/history_transaction_repository.dart';
import 'package:dartz/dartz.dart';

class HistoryTransactionRepositoryImpl extends HistoryTransactionRepository {
  @override
  Future<Either<Failure, DetailTransactionModel>> getDetailOrder(
      {required String invoice}) {
    return serviceLocator<HistoryTransactionRemoteDatasource>().getDetailOrder(
      invoice: invoice,
    );
  }

  @override
  Future<Either<Failure, List<HistoryTransactionResponse>>> getHistoryOrder() {
    return serviceLocator<HistoryTransactionRemoteDatasource>()
        .getHistoryOrder();
  }
}
