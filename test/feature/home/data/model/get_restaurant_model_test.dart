import 'package:antria_mobile_pelanggan/features/home/data/models/response/get_restaurant_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  group('GetRestaurantResponse', () {
    final jsonString = '''
    {
      "review": 5,
      "id": 1,
      "nama_toko": "Restaurant A",
      "deskripsi_toko": "Description of Restaurant A",
      "alamat": "123 Main Street",
      "hari_buka": "Monday-Friday",
      "jam_buka": "08:00",
      "jam_tutup": "22:00",
      "gambar_toko": "image_url",
      "created_at": "2023-07-21T14:11:00.000Z",
      "updated_at": "2023-07-22T14:11:00.000Z"
    }
    ''';

    test('fromJson creates an instance from JSON', () {
      final jsonMap = json.decode(jsonString);
      final response = GetRestaurantResponse.fromJson(jsonMap);

      expect(
          response,
          GetRestaurantResponse(
            review: 5,
            id: 1,
            namaToko: "Restaurant A",
            deskripsiToko: "Description of Restaurant A",
            alamat: "123 Main Street",
            hariBuka: "Monday-Friday",
            jamBuka: "08:00",
            jamTutup: "22:00",
            gambarToko: "image_url",
            createdAt: DateTime.parse("2023-07-21T14:11:00.000Z"),
            updatedAt: DateTime.parse("2023-07-22T14:11:00.000Z"),
          ));
    });

    test('toJson converts an instance to JSON', () {
      final response = GetRestaurantResponse(
        review: 5,
        id: 1,
        namaToko: "Restaurant A",
        deskripsiToko: "Description of Restaurant A",
        alamat: "123 Main Street",
        hariBuka: "Monday-Friday",
        jamBuka: "08:00",
        jamTutup: "22:00",
        gambarToko: "image_url",
        createdAt: DateTime.parse("2023-07-21T14:11:00.000Z"),
        updatedAt: DateTime.parse("2023-07-22T14:11:00.000Z"),
      );

      final jsonMap = response.toJson();
      final expectedJsonMap = json.decode(jsonString);

      expect(jsonMap, expectedJsonMap);
    });
  });
}
