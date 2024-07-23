import 'dart:convert';

import 'package:antria_mobile_pelanggan/features/profile/data/models/update_pelanggan_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UpdatePelangganRequestModel', () {
    test('fromJson and toJson', () {
      // Sample JSON data
      const jsonString = '''
      {
        "username": "testuser",
        "email": "test@example.com",
        "profile_picture": "profile.png",
        "nama": "Test User",
        "handphone": "123456789",
        "alamat": "Test Address"
      }
      ''';

      // Deserialize
      final updatePelangganRequestModel =
          updatePelangganRequestModelFromJson(jsonString);

      expect(updatePelangganRequestModel.username, 'testuser');
      expect(updatePelangganRequestModel.email, 'test@example.com');
      expect(updatePelangganRequestModel.profilePicture, 'profile.png');
      expect(updatePelangganRequestModel.nama, 'Test User');
      expect(updatePelangganRequestModel.handphone, '123456789');
      expect(updatePelangganRequestModel.alamat, 'Test Address');

      // Serialize
      final jsonOutput =
          updatePelangganRequestModelToJson(updatePelangganRequestModel);
      final expectedJson = json.decode(jsonString);
      final actualJson = json.decode(jsonOutput);

      expect(actualJson, expectedJson);
    });
  });
}
