import 'dart:convert';

import 'package:antria_mobile_pelanggan/features/profile/data/models/pelanggan_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PelangganModel', () {
    test('fromJson and toJson', () {
      // Sample JSON data
      const jsonString = '''
      {
        "id": 1,
        "username": "testuser",
        "password": "testpass",
        "email": "test@example.com",
        "emailVerified": true,
        "profile_picture": "profile.png",
        "nama": "Test User",
        "handphone": "123456789",
        "alamat": "Test Address",
        "wallet": 100,
        "created_at": "2023-07-21T14:30:00.000Z",
        "updated_at": "2023-07-21T14:30:00.000Z"
      }
      ''';

      // Deserialize
      final pelangganModel = pelangganModelFromJson(jsonString);

      expect(pelangganModel.id, 1);
      expect(pelangganModel.username, 'testuser');
      expect(pelangganModel.password, 'testpass');
      expect(pelangganModel.email, 'test@example.com');
      expect(pelangganModel.emailVerified, true);
      expect(pelangganModel.profilePicture, 'profile.png');
      expect(pelangganModel.nama, 'Test User');
      expect(pelangganModel.handphone, '123456789');
      expect(pelangganModel.alamat, 'Test Address');
      expect(pelangganModel.wallet, 100);
      expect(
          pelangganModel.createdAt, DateTime.parse("2023-07-21T14:30:00.000Z"));
      expect(
          pelangganModel.updatedAt, DateTime.parse("2023-07-21T14:30:00.000Z"));

      // Serialize
      final jsonOutput = pelangganModelToJson(pelangganModel);
      final expectedJson = json.decode(jsonString);
      final actualJson = json.decode(jsonOutput);

      expect(actualJson, expectedJson);
    });

    test('equality', () {
      final pelangganModel1 = PelangganModel(
        id: 1,
        username: 'testuser',
        password: 'testpass',
        email: 'test@example.com',
        emailVerified: true,
        profilePicture: 'profile.png',
        nama: 'Test User',
        handphone: '123456789',
        alamat: 'Test Address',
        wallet: 100,
        createdAt: DateTime.parse("2023-07-21T14:30:00.000Z"),
        updatedAt: DateTime.parse("2023-07-21T14:30:00.000Z"),
      );

      final pelangganModel2 = PelangganModel(
        id: 1,
        username: 'testuser',
        password: 'testpass',
        email: 'test@example.com',
        emailVerified: true,
        profilePicture: 'profile.png',
        nama: 'Test User',
        handphone: '123456789',
        alamat: 'Test Address',
        wallet: 100,
        createdAt: DateTime.parse("2023-07-21T14:30:00.000Z"),
        updatedAt: DateTime.parse("2023-07-21T14:30:00.000Z"),
      );

      final pelangganModel3 = PelangganModel(
        id: 2,
        username: 'differentuser',
        password: 'differentpass',
        email: 'different@example.com',
        emailVerified: false,
        profilePicture: 'different.png',
        nama: 'Different User',
        handphone: '987654321',
        alamat: 'Different Address',
        wallet: 200,
        createdAt: DateTime.parse("2023-07-22T14:30:00.000Z"),
        updatedAt: DateTime.parse("2023-07-22T14:30:00.000Z"),
      );

      expect(pelangganModel1, pelangganModel2);
      expect(pelangganModel1, isNot(equals(pelangganModel3)));
    });
  });
}
