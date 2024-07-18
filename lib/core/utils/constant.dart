import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIUrl {
  static String get baseUrl => dotenv.get('BASEURL');
  static String get loginUserPath => '/auth/login/pelanggan';
  static String get registerUserPath => '/pelanggan';
  static String get getRestaurantPath => '/mitra';
  static String getPelangganPath(int id) => '/pelanggan/$id';
  static String getInfoRestaurantPath(int mitraId) => '/mitra/$mitraId';
  static String getMenuRestaurantPath(int mitraId) => '/produk/mitra/$mitraId';
  static String get getPesananPath => '/pesanan';
  static String getPesananPelangganPath(int pelangganId) =>
      '/pesanan/pelanggan/$pelangganId/SUCCESS';
  static String getPesananByInvoicePath(String invoice) => '/pesanan/$invoice';
  static String get insertPesanan => '/pesanan';
  static String getQueuePath(int mitraId) => '/antrian/mitra/$mitraId';
  static String putReviewPath(int mitraId, int pelangganId) =>
      '/reviews/$mitraId/$pelangganId';
  static String get imagePath => '/image/';
}
