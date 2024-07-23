import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/history_transaction_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HistoryTransactionResponse', () {
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
      final response = HistoryTransactionResponse.fromJson(testJson);

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
      final response = HistoryTransactionResponse.fromJson(testJson);
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

    test('should correctly compare two instances', () {
      final response1 = HistoryTransactionResponse.fromJson(testJson);
      final response2 = HistoryTransactionResponse.fromJson(testJson);

      expect(response1, equals(response2));
    });

    test('should correctly compare two different instances', () {
      final response1 = HistoryTransactionResponse.fromJson(testJson);
      final response2 = HistoryTransactionResponse.fromJson(
          {...testJson, "invoice": "INV456"});

      expect(response1, isNot(equals(response2)));
    });
  });

  group('Antrian', () {
    final testJson = {
      "id": 3,
      "estimasi": 30,
      "orderstatus": "In Progress",
      "pesananId": "Order123",
      "created_at": "2024-07-22T12:34:56.000Z",
      "updated_at": "2024-07-22T12:34:56.000Z"
    };

    test('fromJson should create an instance from JSON', () {
      final antrian = Antrian.fromJson(testJson);

      expect(antrian.id, 3);
      expect(antrian.estimasi, 30);
      expect(antrian.orderstatus, 'In Progress');
      expect(antrian.pesananId, 'Order123');
      expect(antrian.createdAt, DateTime.parse("2024-07-22T12:34:56.000Z"));
      expect(antrian.updatedAt, DateTime.parse("2024-07-22T12:34:56.000Z"));
    });

    test('toJson should return a JSON map with correct data', () {
      final antrian = Antrian.fromJson(testJson);
      final json = antrian.toJson();

      expect(json['id'], 3);
      expect(json['estimasi'], 30);
      expect(json['orderstatus'], 'In Progress');
      expect(json['pesananId'], 'Order123');
      expect(json['created_at'], '2024-07-22T12:34:56.000Z');
      expect(json['updated_at'], '2024-07-22T12:34:56.000Z');
    });

    test('should correctly compare two instances', () {
      final antrian1 = Antrian.fromJson(testJson);
      final antrian2 = Antrian.fromJson(testJson);

      expect(antrian1, equals(antrian2));
    });

    test('should correctly compare two different instances', () {
      final antrian1 = Antrian.fromJson(testJson);
      final antrian2 = Antrian.fromJson({...testJson, "id": 4});

      expect(antrian1, isNot(equals(antrian2)));
    });
  });

  // Add similar tests for Oderlist, Produk, and Pelanggan classes
}
