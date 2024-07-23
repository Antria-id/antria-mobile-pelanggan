import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/home/data/datasources/restaurant_remote_data_source.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRequest extends Mock implements Request {}

void main() {
  late RestaurantRemoteDatasource datasource;
  late MockRequest mockRequest;

  setUpAll(() {
    mockRequest = MockRequest();
    datasource = RestaurantRemoteDatasourceImpl();
    serviceLocator.registerSingleton<Request>(mockRequest);
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  final tResponseData = [
    {
      "review": 5,
      "id": 1,
      "nama_toko": "Restaurant A",
      "deskripsi_toko": "Description A",
      "alamat": "Address A",
      "hari_buka": "Monday",
      "jam_buka": "08:00",
      "jam_tutup": "20:00",
      "gambar_toko": "image_url",
      "created_at": "2023-01-01T00:00:00.000Z",
      "updated_at": "2023-01-01T00:00:00.000Z",
    }
  ];

  final requestOptions = RequestOptions(path: APIUrl.getRestaurantPath);

  void setUpMockRequestSuccess200() {
    when(() => mockRequest.get(any())).thenAnswer((_) async => Response(
          statusCode: 200,
          data: tResponseData,
          requestOptions: requestOptions,
        ));
  }

  void setUpMockRequestFailure() {
    when(() => mockRequest.get(any())).thenAnswer((_) async => Response(
          statusCode: 404,
          data: {"message": "Not Found"},
          requestOptions: requestOptions,
        ));
  }

  test(
    'should return ConnectionFailure when the response code is 404 or other',
    () async {
      // arrange
      setUpMockRequestFailure();
      // act
      final result = await datasource.getRestaurant();
      // assert
      verify(() => mockRequest.get(APIUrl.getRestaurantPath));
      expect(
          result,
          equals(Left<Failure, List<GetRestaurantResponse>>(
              ConnectionFailure("Not Found"))));
    },
  );

  test(
    'should return ParsingFailure when unable to parse the response',
    () async {
      // arrange
      when(() => mockRequest.get(any())).thenThrow(Exception('Parsing Error'));
      // act
      final result = await datasource.getRestaurant();
      // assert
      verify(() => mockRequest.get(APIUrl.getRestaurantPath));
      expect(
          result,
          equals(Left<Failure, List<GetRestaurantResponse>>(ParsingFailure(
              'Unable to parse the response: Exception(Parsing Error)'))));
    },
  );
}
