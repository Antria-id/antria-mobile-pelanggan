import 'package:antria_mobile_pelanggan/features/history/data/models/order_progress/order_transaction_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('OrderTransactionResponse', () {
    final testJson = {
      "invoice": "INV123",
      "payment": "Credit Card",
      "pemesanan": "Order123",
      "takeaway": true,
      "status": "Completed",
      "pelangganId": 1,
      "mitraId": 2,
      "antrianId": 3,
      "created_at": "2024-07-22T12:34:56.000Z",
      "updated_at": "2024-07-22T12:34:56.000Z",
      "oderlist": [
        {
          "id": 1,
          "quantity": 2,
          "note": "Extra spicy",
          "produkId": 101,
          "pesananId": "Order123",
          "produk": {
            "id": 101,
            "nama_produk": "Pizza",
            "deskripsi_produk": "Cheese Pizza",
            "harga": 15000,
            "gambar": "pizza.jpg",
            "kuantitas": 10,
            "mitraId": 2,
            "show_produk": true,
            "created_at": "2024-07-22T12:34:56.000Z",
            "updated_at": "2024-07-22T12:34:56.000Z"
          }
        }
      ],
      "pelanggan": {
        "id": 1,
        "username": "john_doe",
        "password": "password123",
        "email": "john@example.com",
        "emailVerified": true,
        "profile_picture": "profile.jpg",
        "nama": "John Doe",
        "handphone": "1234567890",
        "alamat": "123 Main St",
        "wallet": 1000,
        "created_at": "2024-07-22T12:34:56.000Z",
        "updated_at": "2024-07-22T12:34:56.000Z"
      },
      "antrian": {
        "id": 3,
        "estimasi": 30,
        "orderstatus": "In Progress",
        "pesananId": "Order123",
        "created_at": "2024-07-22T12:34:56.000Z",
        "updated_at": "2024-07-22T12:34:56.000Z"
      }
    };

    test('fromJson should create an instance from JSON', () {
      final response = OrderTransactionResponse.fromJson(testJson);

      expect(response.invoice, 'INV123');
      expect(response.payment, 'Credit Card');
      expect(response.pemesanan, 'Order123');
      expect(response.takeaway, true);
      expect(response.status, 'Completed');
      expect(response.pelangganId, 1);
      expect(response.mitraId, 2);
      expect(response.antrianId, 3);
      expect(response.createdAt, DateTime.parse("2024-07-22T12:34:56.000Z"));
      expect(response.updatedAt, DateTime.parse("2024-07-22T12:34:56.000Z"));
      expect(response.oderlist, isA<List<Oderlist>>());
      expect(response.pelanggan, isA<Pelanggan>());
      expect(response.antrian, isA<Antrian>());
    });

    test('toJson should return a JSON map with correct data', () {
      final response = OrderTransactionResponse.fromJson(testJson);
      final json = response.toJson();

      expect(json['invoice'], 'INV123');
      expect(json['payment'], 'Credit Card');
      expect(json['pemesanan'], 'Order123');
      expect(json['takeaway'], true);
      expect(json['status'], 'Completed');
      expect(json['pelangganId'], 1);
      expect(json['mitraId'], 2);
      expect(json['antrianId'], 3);
      expect(json['created_at'], '2024-07-22T12:34:56.000Z');
      expect(json['updated_at'], '2024-07-22T12:34:56.000Z');
      expect(json['oderlist'], isA<List<dynamic>>());
      expect(json['pelanggan'], isA<Map<String, dynamic>>());
      expect(json['antrian'], isA<Map<String, dynamic>>());
    });
  });

  // Add similar tests for Antrian, Oderlist, Produk, and Pelanggan classes
}
