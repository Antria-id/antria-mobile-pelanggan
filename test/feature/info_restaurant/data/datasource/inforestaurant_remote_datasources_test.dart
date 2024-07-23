import 'dart:convert';

import 'package:antria_mobile_pelanggan/core/error/failure.dart';
import 'package:antria_mobile_pelanggan/core/services/services_locater.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:antria_mobile_pelanggan/core/utils/request.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/datasources/info_restaurant/inforestaurant_remote_datasources.dart';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/info_restaurant_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRequest extends Mock implements Request {}

void main() {
  late InfoRestaurantRemoteDatasource datasource;
  late MockRequest mockRequest;

  setUpAll(() {
    mockRequest = MockRequest();
    datasource = InfoRestaurantRemoteDatasourceImpl();
    serviceLocator.registerFactory<Request>(() => mockRequest);
  });

  tearDownAll(() async {
    await serviceLocator.reset(dispose: true);
  });

  final mitraId = 1;
  final tGetInfoRestaurantResponse = GetInfoRestaurantResponse(
    review: 4,
    id: mitraId,
    namaToko: "Test Restaurant",
    deskripsiToko: "A great place to eat",
    alamat: "123 Test St",
    linkGmaps: "http://maps.google.com",
    hariBuka: "Monday-Sunday",
    jamBuka: "08:00",
    jamTutup: "22:00",
    gambarToko: "http://example.com/image.png",
    subscription: true,
    statusToko: "Open",
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );

  final tResponseJson = json.encode(tGetInfoRestaurantResponse.toJson());

  test('should return GetInfoRestaurantResponse when the response code is 200',
      () async {
    // arrange
    when(() => mockRequest.getById(any(),
            queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => Response(
              data: jsonDecode(tResponseJson),
              statusCode: 200,
              requestOptions:
                  RequestOptions(path: APIUrl.getInfoRestaurantPath(mitraId)),
            ));

    // act
    final result = await datasource.getInfoRestaurant(mitraId);

    // assert
    verify(() => mockRequest.getById(APIUrl.getInfoRestaurantPath(mitraId),
        queryParameters: {'id': mitraId}));
    expect(result, Right(tGetInfoRestaurantResponse));
  });

  test('should return ConnectionFailure when the response code is not 200',
      () async {
    // arrange
    when(() => mockRequest.getById(any(),
            queryParameters: any(named: 'queryParameters')))
        .thenAnswer((_) async => Response(
              data: {'message': 'Something went wrong'},
              statusCode: 404,
              requestOptions:
                  RequestOptions(path: APIUrl.getInfoRestaurantPath(mitraId)),
            ));

    // act
    final result = await datasource.getInfoRestaurant(mitraId);

    // assert
    verify(() => mockRequest.getById(APIUrl.getInfoRestaurantPath(mitraId),
        queryParameters: {'id': mitraId}));
    expect(result, Left(ConnectionFailure('Something went wrong')));
  });

  test('should return ParsingFailure when an exception occurs', () async {
    // arrange
    when(() => mockRequest.getById(any(),
            queryParameters: any(named: 'queryParameters')))
        .thenThrow(Exception('Unable to parse the response'));

    // act
    final result = await datasource.getInfoRestaurant(mitraId);

    // assert
    verify(() => mockRequest.getById(APIUrl.getInfoRestaurantPath(mitraId),
        queryParameters: {'id': mitraId}));
    expect(result, const Left(ParsingFailure('Unable to parse the response')));
  });
}
