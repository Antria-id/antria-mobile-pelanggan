import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/history_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/history_transaction_response.dart';
import 'package:dartz/dartz.dart';

class GetHistoryTransactionUsecase {
  Future<Either<Failure, List<HistoryTransactionResponse>>> getHistoryOrder() {
    return serviceLocator<HistoryTransactionRemoteDatasource>()
        .getHistoryOrder();
  }
}
