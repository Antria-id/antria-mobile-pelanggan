import 'dart:convert';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  final String? accessToken;

  LoginResponse({
    this.accessToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
      };
}
