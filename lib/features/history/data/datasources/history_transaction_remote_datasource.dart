// import 'package:antria_mobile_pelanggan/core/error/failure.dart';
// import 'package:antria_mobile_pelanggan/features/history/data/models/detail_transaction_model.dart';
// import 'package:dartz/dartz.dart';

// abstract class RiwayatTransaksiRemoteDatasource {
//   Future<Either<Failure, List<RiwayatTransaksiResponse>>> getRiwayatTransaksi();
//   Future<Either<Failure, DetailTransactionModel>> getDetailTransaksi(
//       {required String invoice});
// }

// class RiwayatTransaksiRemoteDatasourceImpl
//     implements RiwayatTransaksiRemoteDatasource {
//   final Request request = serviceLocator<Request>();
//   @override
//   Future<Either<Failure, List<RiwayatTransaksiResponse>>>
//       getRiwayatTransaksi() async {
//     try {
//       final UserCacheService userCacheService =
//           serviceLocator<UserCacheService>();
//       final UserModel? user = await userCacheService.getUser();
//       if (user == null) {
//         return const Left(ParsingFailure('User not found'));
//       }
//       final int mitraId = user.mitraId!;
//       final response = await request.get(APIUrl.getPesananPath(mitraId));

//       if (response.statusCode == 200) {
//         final dynamic responseData = response.data;
//         if (responseData is List<dynamic>) {
//           final List<RiwayatTransaksiResponse> pesanan = responseData
//               .map((json) => RiwayatTransaksiResponse.fromJson(json))
//               .toList();
//           return Right(pesanan);
//         } else {
//           return const Left(ParsingFailure('Invalid response format'));
//         }
//       } else {
//         return Left(ConnectionFailure(response.data['message']));
//       }
//     } catch (e) {
//       return Left(ParsingFailure('Unable to parse the response: $e'));
//     }
//   }

//   @override
//   Future<Either<Failure, DetailTransactionModel>> getDetailTransaksi(
//       {required String invoice}) async {
//     try {
//       final response =
//           await request.get(APIUrl.getPesananByInvoicePath(invoice));
//       if (response.statusCode == 200) {
//         final DetailTransactionModel DetailTransactionModel =
//             DetailTransactionModel.fromJson(response.data);
//         return Right(DetailTransactionModel);
//       }
//       return Left(
//         ConnectionFailure(response.data['message']),
//       );
//     } catch (e) {
//       return Left(ParsingFailure('Unable to parse the response: $e'));
//     }
//   }
// }