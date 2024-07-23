import 'dart:convert';

import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DetailTransactionModel', () {
    test('should parse from JSON correctly', () {
      // Your existing test
    });

    test('should convert to JSON correctly', () {
      final model = DetailTransactionModel(
        invoice: 'INV123',
        payment: 'Paid',
        pemesanan: 'Order123',
        takeaway: true,
        status: 'Completed',
        pelangganId: 1,
        mitraId: 2,
        antrianId: 3,
        createdAt: DateTime.parse('2024-07-22T12:00:00.000Z'),
        updatedAt: DateTime.parse('2024-07-22T12:00:00.000Z'),
        pelanggan: Pelanggan(
          id: 1,
          username: 'user',
          password: 'pass',
          email: 'user@example.com',
          emailVerified: true,
          profilePicture: 'profile.jpg',
          nama: 'User Name',
          handphone: '1234567890',
          alamat: '123 Street',
          wallet: 100,
          createdAt: DateTime.parse('2024-07-22T12:00:00.000Z'),
          updatedAt: DateTime.parse('2024-07-22T12:00:00.000Z'),
        ),
        antrian: Antrian(
          id: 1,
          estimasi: 30,
          orderstatus: 'Pending',
          pesananId: 'Order123',
          createdAt: DateTime.parse('2024-07-22T12:00:00.000Z'),
          updatedAt: DateTime.parse('2024-07-22T12:00:00.000Z'),
        ),
        oderlist: [
          Oderlist(
            id: 1,
            quantity: 2,
            note: 'Extra sauce',
            produkId: 1,
            pesananId: 'Order123',
            produk: Produk(
              id: 1,
              namaProduk: 'Product 1',
              deskripsiProduk: 'Description 1',
              harga: 100,
              gambar: 'image.jpg',
              kuantitas: 10,
              mitraId: 1,
              showProduk: true,
              createdAt: DateTime.parse('2024-07-22T12:00:00.000Z'),
              updatedAt: DateTime.parse('2024-07-22T12:00:00.000Z'),
            ),
          ),
        ],
      );

      final jsonData = model.toJson();
      final jsonString = json.encode(jsonData);

      final expectedJsonString = '''
      {
        "invoice": "INV123",
        "payment": "Paid",
        "pemesanan": "Order123",
        "takeaway": true,
        "status": "Completed",
        "pelangganId": 1,
        "mitraId": 2,
        "antrianId": 3,
        "created_at": "2024-07-22T12:00:00.000Z",
        "updated_at": "2024-07-22T12:00:00.000Z",
        "pelanggan": {
          "id": 1,
          "username": "user",
          "password": "pass",
          "email": "user@example.com",
          "emailVerified": true,
          "profile_picture": "profile.jpg",
          "nama": "User Name",
          "handphone": "1234567890",
          "alamat": "123 Street",
          "wallet": 100,
          "created_at": "2024-07-22T12:00:00.000Z",
          "updated_at": "2024-07-22T12:00:00.000Z"
        },
        "antrian": {
          "id": 1,
          "estimasi": 30,
          "orderstatus": "Pending",
          "pesananId": "Order123",
          "created_at": "2024-07-22T12:00:00.000Z",
          "updated_at": "2024-07-22T12:00:00.000Z"
        },
        "oderlist": [
          {
            "id": 1,
            "quantity": 2,
            "note": "Extra sauce",
            "produkId": 1,
            "pesananId": "Order123",
            "produk": {
              "id": 1,
              "nama_produk": "Product 1",
              "deskripsi_produk": "Description 1",
              "harga": 100,
              "gambar": "image.jpg",
              "kuantitas": 10,
              "mitraId": 1,
              "show_produk": true,
              "created_at": "2024-07-22T12:00:00.000Z",
              "updated_at": "2024-07-22T12:00:00.000Z"
            }
          }
        ]
      }
      ''';

      // Normalize JSON strings by removing whitespace and newlines
      final normalizedExpectedJsonString =
          expectedJsonString.replaceAll(RegExp(r'\s+'), '');
      final normalizedJsonString = jsonString.replaceAll(RegExp(r'\s+'), '');

      expect(normalizedJsonString, normalizedExpectedJsonString);
    });
  });
}
