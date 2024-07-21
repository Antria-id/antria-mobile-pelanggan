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
      final responseWaiting = await request.get(
        APIUrl.getPesananPelangganPath(pelangganId),
        data: {'status_order': 'WAITING'},
      );

      final responseProcess = await request.get(
        APIUrl.getPesananPelangganPath(pelangganId),
        data: {'status_order': 'PROCESS'},
      );

      if (responseWaiting.statusCode == 200 &&
          responseProcess.statusCode == 200) {
        final List<dynamic> responseDataWaiting = responseWaiting.data;
        final List<dynamic> responseDataProcess = responseProcess.data;

        final List<OrderTransactionResponse> pesananWaiting =
            responseDataWaiting
                .map((json) => OrderTransactionResponse.fromJson(json))
                .toList();
        final List<OrderTransactionResponse> pesananProcess =
            responseDataProcess
                .map((json) => OrderTransactionResponse.fromJson(json))
                .toList();

        final List<OrderTransactionResponse> filteredPesananWaiting =
            pesananWaiting
                .where((transaction) => transaction.pelangganId == user.sub)
                .toList();
        final List<OrderTransactionResponse> filteredPesananProcess =
            pesananProcess
                .where((transaction) => transaction.pelangganId == user.sub)
                .toList();

        final List<OrderTransactionResponse> combinedPesanan = []
          ..addAll(filteredPesananWaiting)
          ..addAll(filteredPesananProcess);

        return Right(combinedPesanan);
      } else {
        return Left(ConnectionFailure(responseWaiting.data['message'] ??
            responseProcess.data['message']));
      }
    } catch (e) {
      return Left(ParsingFailure('Unable to parse the response: $e'));
    }
  }
}
