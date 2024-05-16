import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) =>
    json.encode(data.toJson());

class RegisterRequest {
  final String? username;
  final String? password;
  final String? email;
  final String? nama;

  RegisterRequest({
    this.username,
    this.password,
    this.email,
    this.nama,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        username: json["username"],
        password: json["password"],
        email: json["email"],
        nama: json["nama"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "email": email,
        "nama": nama,
      };
}
