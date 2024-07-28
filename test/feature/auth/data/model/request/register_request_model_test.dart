import 'dart:convert';
import 'package:antria_mobile_pelanggan/features/auth/data/models/request/register_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture.dart';

void main() {
  RegisterRequest registerRequest = RegisterRequest(
    username: "rovino",
    password: "rovino11223344",
    email: "rovino@verni.yt",
    nama: "rovinos",
  );

  group(
    'json serialization ',
    () {
      test(
        'fromJson should return RegisterRequestModel object ',
        () {
          //arrange
          final jsonData = fixture('register_request.json');
          //act
          final registerRequestModel =
              RegisterRequest.fromJson(jsonDecode(jsonData));
          // assert
          expect(registerRequestModel, registerRequest);
        },
      );
      test(
        'toJson should return json string ',
        () {
          //act
          final jsonData = registerRequest.toJson();
          // assert
          final userRequest = {
            "pelangganData": {
              "username": "rovino",
              "password": "rovino11223344",
              "email": "rovino@verni.yt",
              "nama": "rovinos",
            },
          };
          expect(userRequest, jsonData);
        },
      );
    },
  );
}
