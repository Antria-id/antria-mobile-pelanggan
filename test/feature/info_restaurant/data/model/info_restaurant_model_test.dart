import 'dart:convert';
import 'package:antria_mobile_pelanggan/features/info_restaurant/data/models/info_restaurant_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('GetInfoRestaurantResponse', () {
    const jsonString = '''
    {
      "review": 5,
      "id": 1,
      "nama_toko": "Test Restaurant",
      "deskripsi_toko": "A great place to dine in",
      "alamat": "123 Test St.",
      "linkGmaps": "http://maps.google.com/?q=123+Test+St.",
      "hari_buka": "Monday-Friday",
      "jam_buka": "09:00",
      "jam_tutup": "22:00",
      "gambar_toko": "http://example.com/image.jpg",
      "subscription": true,
      "status_toko": "Open",
      "created_at": "2023-07-21T15:00:00.000Z",
      "updated_at": "2023-07-22T15:00:00.000Z"
    }
    ''';

    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    test('fromJson creates an instance of GetInfoRestaurantResponse', () {
      final response = GetInfoRestaurantResponse.fromJson(jsonMap);

      expect(response.review, 5);
      expect(response.id, 1);
      expect(response.namaToko, "Test Restaurant");
      expect(response.deskripsiToko, "A great place to dine in");
      expect(response.alamat, "123 Test St.");
      expect(response.linkGmaps, "http://maps.google.com/?q=123+Test+St.");
      expect(response.hariBuka, "Monday-Friday");
      expect(response.jamBuka, "09:00");
      expect(response.jamTutup, "22:00");
      expect(response.gambarToko, "http://example.com/image.jpg");
      expect(response.subscription, true);
      expect(response.statusToko, "Open");
      expect(response.createdAt, DateTime.parse("2023-07-21T15:00:00.000Z"));
      expect(response.updatedAt, DateTime.parse("2023-07-22T15:00:00.000Z"));
    });

    test(
        'toJson converts an instance of GetInfoRestaurantResponse to a JSON map',
        () {
      final response = GetInfoRestaurantResponse.fromJson(jsonMap);
      final jsonOutput = response.toJson();

      expect(jsonOutput['review'], 5);
      expect(jsonOutput['id'], 1);
      expect(jsonOutput['nama_toko'], "Test Restaurant");
      expect(jsonOutput['deskripsi_toko'], "A great place to dine in");
      expect(jsonOutput['alamat'], "123 Test St.");
      expect(jsonOutput['linkGmaps'], "http://maps.google.com/?q=123+Test+St.");
      expect(jsonOutput['hari_buka'], "Monday-Friday");
      expect(jsonOutput['jam_buka'], "09:00");
      expect(jsonOutput['jam_tutup'], "22:00");
      expect(jsonOutput['gambar_toko'], "http://example.com/image.jpg");
      expect(jsonOutput['subscription'], true);
      expect(jsonOutput['status_toko'], "Open");
      expect(jsonOutput['created_at'], "2023-07-21T15:00:00.000Z");
      expect(jsonOutput['updated_at'], "2023-07-22T15:00:00.000Z");
    });

    test('getInfoRestaurantResponseFromJson returns a valid object', () {
      final response = getInfoRestaurantResponseFromJson(jsonString);

      expect(response.review, 5);
      expect(response.id, 1);
      expect(response.namaToko, "Test Restaurant");
      expect(response.deskripsiToko, "A great place to dine in");
      expect(response.alamat, "123 Test St.");
      expect(response.linkGmaps, "http://maps.google.com/?q=123+Test+St.");
      expect(response.hariBuka, "Monday-Friday");
      expect(response.jamBuka, "09:00");
      expect(response.jamTutup, "22:00");
      expect(response.gambarToko, "http://example.com/image.jpg");
      expect(response.subscription, true);
      expect(response.statusToko, "Open");
      expect(response.createdAt, DateTime.parse("2023-07-21T15:00:00.000Z"));
      expect(response.updatedAt, DateTime.parse("2023-07-22T15:00:00.000Z"));
    });

    test('getInfoRestaurantResponseToJson returns a valid JSON string', () {
      final response = GetInfoRestaurantResponse.fromJson(jsonMap);
      final jsonStringOutput = getInfoRestaurantResponseToJson(response);
      final jsonMapOutput = json.decode(jsonStringOutput);

      expect(jsonMapOutput['review'], 5);
      expect(jsonMapOutput['id'], 1);
      expect(jsonMapOutput['nama_toko'], "Test Restaurant");
      expect(jsonMapOutput['deskripsi_toko'], "A great place to dine in");
      expect(jsonMapOutput['alamat'], "123 Test St.");
      expect(
          jsonMapOutput['linkGmaps'], "http://maps.google.com/?q=123+Test+St.");
      expect(jsonMapOutput['hari_buka'], "Monday-Friday");
      expect(jsonMapOutput['jam_buka'], "09:00");
      expect(jsonMapOutput['jam_tutup'], "22:00");
      expect(jsonMapOutput['gambar_toko'], "http://example.com/image.jpg");
      expect(jsonMapOutput['subscription'], true);
      expect(jsonMapOutput['status_toko'], "Open");
      expect(jsonMapOutput['created_at'], "2023-07-21T15:00:00.000Z");
      expect(jsonMapOutput['updated_at'], "2023-07-22T15:00:00.000Z");
    });
  });
}
