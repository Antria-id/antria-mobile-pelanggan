import 'package:antria_mobile_pelanggan/core/services/user_cache_services.dart';
import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Request {
  final Dio dio = Dio();
  Request() {
    updateDioInterceptors();
  }

  void updateAuthorization(String accessToken) {
    dio.options.headers['Authorization'] = "Bearer $accessToken";
  }

  void updateDioInterceptors() async {
    final token = await UserCacheService().getToken();
    dio.options = BaseOptions(
      baseUrl: APIUrl.baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (value) {
        return value! <= 500;
      },
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    dio
      ..interceptors.add(
        LogInterceptor(
          requestBody: kDebugMode ? true : false,
          responseBody: kDebugMode ? true : false,
          requestHeader: kDebugMode ? true : false,
        ),
      )
      ..interceptors.add(
        InterceptorsWrapper(
          onError: (e, handler) {
            if (e.response?.statusCode == 402) {
              //logout user and go to login page
            }
            return handler.next(e);
          },
        ),
      );
  }

  void clearAuthorization() {
    dio.options.headers.remove('Authorization');
  }

  // requests
  Future<Response> get(String path, {Object? data}) async {
    return await dio.get(path, data: data);
  }

  Future<Response> post(String path, {Object? data}) async {
    return await dio.post(path, data: data);
  }

  Future<Response> getById(String path,
      {required Map<String, int> queryParameters}) async {
    return await dio.get(path);
  }

  Future<Response> put(String path,
      {Object? data, Map<String, dynamic>? headers}) async {
    return await dio.put(
      path,
      data: data,
      options: Options(headers: headers),
    );
  }
}
