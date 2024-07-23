import 'package:antria_mobile_pelanggan/core/utils/constant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  group('APIUrl', () {
    test('baseUrl should return the correct value from dotenv', () {
      expect(APIUrl.baseUrl, 'https://development.verni.yt');
    });

    test('loginUserPath should return the correct value', () {
      expect(APIUrl.loginUserPath, '/auth/login/pelanggan');
    });

    test('registerUserPath should return the correct value', () {
      expect(APIUrl.registerUserPath, '/pelanggan');
    });

    test('getRestaurantPath should return the correct value', () {
      expect(APIUrl.getRestaurantPath, '/mitra');
    });

    test('getPelangganPath should return the correct value with pelangganId',
        () {
      expect(APIUrl.getPelangganPath(123), '/pelanggan/123');
    });

    test('getInfoRestaurantPath should return the correct value with mitraId',
        () {
      expect(APIUrl.getInfoRestaurantPath(123), '/mitra/123');
    });

    test('getMenuRestaurantPath should return the correct value with mitraId',
        () {
      expect(APIUrl.getMenuRestaurantPath(123), '/produk/mitra/123');
    });

    test('getPesananPath should return the correct value', () {
      expect(APIUrl.getPesananPath, '/pesanan');
    });

    test(
        'getPesananPelangganPath should return the correct value with pelangganId',
        () {
      expect(APIUrl.getPesananPelangganPath(123),
          '/pesanan/pelanggan/123/SUCCESS');
    });

    test('getPesananByInvoicePath should return the correct value with invoice',
        () {
      expect(APIUrl.getPesananByInvoicePath('INV123'), '/pesanan/INV123');
    });

    test('imagePath should return the correct value', () {
      expect(APIUrl.imagePath, '/image/');
    });
  });
}
