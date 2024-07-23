import 'dart:convert';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserModel', () {
    final jsonString = '''
    {
      "sub": 1,
      "username": "testuser",
      "role": "admin",
      "iat": 1617181718,
      "exp": 1617181818
    }
    ''';

    final jsonMap = {
      "sub": 1,
      "username": "testuser",
      "role": "admin",
      "iat": 1617181718,
      "exp": 1617181818
    };

    test('fromJson creates a valid UserModel', () {
      final userModel = UserModel.fromJson(json.decode(jsonString));

      expect(userModel.sub, 1);
      expect(userModel.username, "testuser");
      expect(userModel.role, "admin");
      expect(userModel.iat, 1617181718);
      expect(userModel.exp, 1617181818);
    });

    test('toJson returns a valid JSON map', () {
      final userModel = UserModel.fromJson(json.decode(jsonString));
      final jsonResult = userModel.toJson();

      expect(jsonResult, jsonMap);
    });

    test('userModelFromJson creates a valid UserModel', () {
      final userModel = userModelFromJson(jsonString);

      expect(userModel.sub, 1);
      expect(userModel.username, "testuser");
      expect(userModel.role, "admin");
      expect(userModel.iat, 1617181718);
      expect(userModel.exp, 1617181818);
    });

    test('userModelToJson returns a valid JSON string', () {
      final userModel = UserModel.fromJson(json.decode(jsonString));
      final jsonStringResult = userModelToJson(userModel);

      expect(json.decode(jsonStringResult), jsonMap);
    });

    test('supports value equality', () {
      final userModel1 = UserModel.fromJson(json.decode(jsonString));
      final userModel2 = UserModel.fromJson(json.decode(jsonString));

      expect(userModel1, equals(userModel2));
    });
  });
}
