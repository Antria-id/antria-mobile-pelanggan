import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';
import 'package:antria_mobile_pelanggan/features/queue/data/models/queue_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class QueueRemoteDatasource {
  Future<Either<Failure, List<QueueListModel>>> getQueue(
      {required int mitraId});
}

class QueueRemoteDatasourceImpl implements QueueRemoteDatasource {
  final Request request = serviceLocator<Request>();

  @override
  Future<Either<Failure, List<QueueListModel>>> getQueue(
      {required int mitraId}) async {
    try {
      final response = await request.get(
        APIUrl.getQueuePath(mitraId),
        data: {
          "limit": 20,
        },
      );

      if (response.statusCode == 200) {
        final dynamic responseData = response.data;
        if (responseData is List<dynamic>) {
          List<QueueListModel> antrianList = [];

          for (var json in responseData) {
            QueueListModel antrian = QueueListModel.fromJson(json);
            final invoice = antrian.pesananId;
            final pesananResponse =
                await request.get(APIUrl.getPesananByInvoicePath(invoice!));

            if (pesananResponse.statusCode == 200) {
              final dynamic pesananData = pesananResponse.data;
              if (pesananData is Map<String, dynamic>) {
                antrian.detailTransactionModel =
                    DetailTransactionModel.fromJson(pesananData);
              } else {
                return const Left(
                    ParsingFailure('Invalid pesanan response format'));
              }
            } else {
              return Left(ConnectionFailure(pesananResponse.data['message']));
            }
            antrianList.add(antrian);
          }

          return Right(antrianList);
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
