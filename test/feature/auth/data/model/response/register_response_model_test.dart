import 'dart:convert';
import 'package:antria_mobile_pelanggan/features/auth/data/models/response/resgister_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixture/fixture.dart';

void main() {
  RegisterResponse registerResponse = RegisterResponse(
    pelanggan: Pelanggan(
      id: 2,
      username: "Rovino",
      password:
          "\$2b\$10\$7T1SmhYNwprjpMXCPjbdBuL2Ab/aLzgu1YGaWfPz2ek14J.7eO9oK",
      email: "rovinoz@verni.yt",
      emailVerified: false,
      profilePicture: "",
      nama: "rovinos",
      handphone: "",
      alamat: "",
      wallet: 1000000,
      createdAt: DateTime.parse("2024-05-01T10:35:07.243Z"),
      updatedAt: DateTime.parse("2024-07-21T14:52:52.965Z"),
    ),
  );

  group(
    'json serialization ',
    () {
      test(
        'fromJson should return registerResponseModel object ',
        () {
          //arrange
          final jsonData = fixture('register_response.json');
          //act
          final registerResponseModel =
              RegisterResponse.fromJson(jsonDecode(jsonData));
          // assert
          expect(registerResponseModel, registerResponse);
        },
      );

      test(
        'toJson should return json string ',
        () {
          //act
          final jsonData = registerResponse.toJson();
          // assert
          final expectedJsonData = {
            "pelanggan": {
              "id": 2,
              "username": "Rovino",
              "password":
                  "\$2b\$10\$7T1SmhYNwprjpMXCPjbdBuL2Ab/aLzgu1YGaWfPz2ek14J.7eO9oK",
              "email": "rovinoz@verni.yt",
              "emailVerified": false,
              "profile_picture": "",
              "nama": "rovinos",
              "handphone": "",
              "alamat": "",
              "wallet": 1000000,
              "created_at": "2024-05-01T10:35:07.243Z",
              "updated_at": "2024-07-21T14:52:52.965Z"
            }
          };
          expect(jsonData, expectedJsonData);
        },
      );
    },
  );
}
