import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/order_progress/order_transaction_response.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderTransactionRemoteDatasource {
  Future<Either<Failure, List<OrderTransactionResponse>>> getProgressOrder();
}

class OrderTransactionRemoteDatasourceImpl
    implements OrderTransactionRemoteDatasource {
  final Request request = serviceLocator<Request>();

  @override
  Future<Either<Failure, List<OrderTransactionResponse>>>
      getProgressOrder() async {
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
        data: {'status_order': 'WAITING'},
      );

      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        if (responseData is List<dynamic>) {
          final List<OrderTransactionResponse> pesanan = responseData
              .map((json) => OrderTransactionResponse.fromJson(json))
              .toList();
          final List<OrderTransactionResponse> filteredPesanan = pesanan
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
}
