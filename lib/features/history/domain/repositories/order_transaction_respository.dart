import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/order_progress/order_transaction_response.dart';
import 'package:dartz/dartz.dart';

abstract class OrderTransactionRepository {
  Future<Either<Failure, List<OrderTransactionResponse>>> getProgressOrder();
}
