import 'dart:convert';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/login_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture.dart';

void main() {
  LoginResponse loginResponse = LoginResponse(
      accessToken:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXJuYW1lIjoicm92aW5vIiwicm9sZSI6InBlbGFuZ2dhbiIsInBpY3R1cmUiOiJmZWE4NjQwMi0wOTRjLTQyYzItYjc5MS0xNDlhZTAyY2Y1YzkuanBnIiwiZW1haWwiOiJyb3Zpbm9AdmVybmkueXQiLCJpYXQiOjE3MjE1ODI2NTYsImV4cCI6MTcyMTY2OTA1Nn0.twfyE9iTdR76gbvKb5hpDpYWLfiBNObS90klDjiK26Q");
  group(
    'json serialization ',
    () {
      test(
        'fromJson should return LoginResponseModel object ',
        () {
          //arrange
          final jsonData = fixture('accessToken_response.json');
          //act
          final loginResponseModel =
              LoginResponse.fromJson(jsonDecode(jsonData));
          // assert
          expect(loginResponseModel, loginResponse);
        },
      );
      test(
        'toJson should return json string ',
        () {
          //act
          final jsonData = loginResponse.toJson();
          // assert
          final accessToken = {
            "access_token":
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOjIsInVzZXJuYW1lIjoicm92aW5vIiwicm9sZSI6InBlbGFuZ2dhbiIsInBpY3R1cmUiOiJmZWE4NjQwMi0wOTRjLTQyYzItYjc5MS0xNDlhZTAyY2Y1YzkuanBnIiwiZW1haWwiOiJyb3Zpbm9AdmVybmkueXQiLCJpYXQiOjE3MjE1ODI2NTYsImV4cCI6MTcyMTY2OTA1Nn0.twfyE9iTdR76gbvKb5hpDpYWLfiBNObS90klDjiK26Q"
          };
          expect(accessToken, jsonData);
        },
      );
    },
  );
}
