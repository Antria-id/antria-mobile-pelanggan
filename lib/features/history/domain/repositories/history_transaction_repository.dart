import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/detail_transaction_model.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/history_transaction_response.dart';
import 'package:dartz/dartz.dart';

abstract class HistoryTransactionRepository {
  Future<Either<Failure, List<HistoryTransactionResponse>>> getHistoryOrder();
  Future<Either<Failure, DetailTransactionModel>> getDetailOrder(
      {required String invoice});
}
