import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:antria_mobile_pelanggan/features/home/data/models/user/user_response_model.dart';

import '../../../../../fixture/fixture.dart';

void main() {
  UserModel userModel = UserModel(
    sub: 2,
    username: "rovinos",
    role: "",
    iat: 1720319728,
    exp: 1720406128,
  );

  group('json serialization', () {
    test('fromJson should return UserModel object', () {
      // arrange
      final jsonData = fixture('user_model_response.json');
      // act
      final userModelJson = UserModel.fromJson(jsonDecode(jsonData));
      // assert
      expect(userModelJson, userModel);
    });

    test('toJson should return json string', () {
      // act
      final jsonData = userModel.toJson();
      // assert
      final response = {
        "sub": 2,
        "username": "rovinos",
        "role": "",
        "iat": 1720319728,
        "exp": 1720406128,
      };
      expect(jsonData, response);
    });
  });
}
