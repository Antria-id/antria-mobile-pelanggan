import 'dart:convert';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/get_menu_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetMenuResponse', () {
    const jsonString = '''
    [
      {
        "id": 1,
        "nama_produk": "Test Product",
        "deskripsi_produk": "A delicious test product",
        "harga": 10000,
        "gambar": "http://example.com/image.jpg",
        "kuantitas": 10,
        "mitraId": 2,
        "created_at": "2023-07-21T15:00:00.000Z",
        "updated_at": "2023-07-22T15:00:00.000Z"
      }
    ]
    ''';

    final List<dynamic> jsonList = json.decode(jsonString);

    test('fromJson creates a list of GetMenuResponse', () {
      final menuList = getMenuResponseFromJson(jsonString);

      expect(menuList.length, 1);
      final menu = menuList.first;

      expect(menu.id, 1);
      expect(menu.namaProduk, "Test Product");
      expect(menu.deskripsiProduk, "A delicious test product");
      expect(menu.harga, 10000);
      expect(menu.gambar, "http://example.com/image.jpg");
      expect(menu.kuantitas, 10);
      expect(menu.mitraId, 2);
      expect(menu.createdAt, DateTime.parse("2023-07-21T15:00:00.000Z"));
      expect(menu.updatedAt, DateTime.parse("2023-07-22T15:00:00.000Z"));
    });

    test('toJson converts a list of GetMenuResponse to JSON', () {
      final menu = GetMenuResponse(
        id: 1,
        namaProduk: "Test Product",
        deskripsiProduk: "A delicious test product",
        harga: 10000,
        gambar: "http://example.com/image.jpg",
        kuantitas: 10,
        mitraId: 2,
        createdAt: DateTime.parse("2023-07-21T15:00:00.000Z"),
        updatedAt: DateTime.parse("2023-07-22T15:00:00.000Z"),
      );

      final jsonOutput = getMenuResponseToJson([menu]);
      final jsonListOutput = json.decode(jsonOutput);

      expect(jsonListOutput.length, 1);
      final jsonMenu = jsonListOutput.first;

      expect(jsonMenu['id'], 1);
      expect(jsonMenu['nama_produk'], "Test Product");
      expect(jsonMenu['deskripsi_produk'], "A delicious test product");
      expect(jsonMenu['harga'], 10000);
      expect(jsonMenu['gambar'], "http://example.com/image.jpg");
      expect(jsonMenu['kuantitas'], 10);
      expect(jsonMenu['mitraId'], 2);
      expect(jsonMenu['created_at'], "2023-07-21T15:00:00.000Z");
      expect(jsonMenu['updated_at'], "2023-07-22T15:00:00.000Z");
    });
  });
}
