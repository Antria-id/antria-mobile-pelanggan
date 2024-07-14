import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:dartz/dartz.dart';
import '../../models/done_order/history_transaction_response.dart';

abstract class HistoryTransactionRemoteDatasource {
  Future<Either<Failure, List<HistoryTransactionResponse>>> getHistoryOrder();
  Future<Either<Failure, DetailTransactionModel>> getDetailOrder(
      {required String invoice});
}

class HistoryTransactionRemoteDatasourceImpl
    implements HistoryTransactionRemoteDatasource {
  final Request request = serviceLocator<Request>();

  @override
  Future<Either<Failure, List<HistoryTransactionResponse>>>
      getHistoryOrder() async {
    try {
      final UserCacheService userCacheService =
          serviceLocator<UserCacheService>();
      final UserModel? user = await userCacheService.getUser();
      if (user == null) {
        return const Left(ParsingFailure('User not found'));
      }
      final int pelangganId = user.sub!;
      final response = await request.get(
        APIUrl.getPesananPelangganPath(pelangganId),
        data: {'status_order': 'ALLDONE'},
      );

      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        if (responseData is List<dynamic>) {
          final List<HistoryTransactionResponse> pesanan = responseData
              .map((json) => HistoryTransactionResponse.fromJson(json))
              .toList();
          final List<HistoryTransactionResponse> filteredPesanan = pesanan
              .where((transaction) => transaction.pelangganId == user.sub)
              .toList();
          return Right(filteredPesanan);
        } else {
          return const Left(ParsingFailure('Invalid response format'));
        }
      } else {
        return Left(ConnectionFailure(response.data['message']));
      }
    } catch (e) {
      return Left(ParsingFailure('Unable to parse the response: $e'));
    }
  }

  @override
  Future<Either<Failure, DetailTransactionModel>> getDetailOrder(
      {required String invoice}) async {
    try {
      final response =
          await request.get(APIUrl.getPesananByInvoicePath(invoice));
      if (response.statusCode == 200) {
        final DetailTransactionModel detailTransactionModel =
            DetailTransactionModel.fromJson(response.data);
        return Right(detailTransactionModel);
      }
      return Left(
        ConnectionFailure(response.data['message']),
      );
    } catch (e) {
      return Left(ParsingFailure('Unable to parse the response: $e'));
    }
  }
}
