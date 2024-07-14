import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/features/history/data/datasources/order_progress/order_transaction_remote_datasource.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/order_progress/order_transaction_response.dart';
import 'package:antria_mobile_pelanggan/features/history/domain/repositories/order_transaction_respository.dart';
import 'package:dartz/dartz.dart';

class OrderTransactionRepositoryImpl extends OrderTransactionRepository {
  @override
  Future<Either<Failure, List<OrderTransactionResponse>>> getProgressOrder() {
    return serviceLocator<OrderTransactionRemoteDatasource>()
        .getProgressOrder();
  }
}
