import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) =>
    RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) =>
    json.encode(data.toJson());

class RegisterResponse {
  final int? id;
  final String? username;
  final String? password;
  final String? email;
  final bool? emailVerified;
  final String? profilePicture;
  final String? nama;
  final String? handphone;
  final String? alamat;
  final int? wallet;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  RegisterResponse({
    this.id,
    this.username,
    this.password,
    this.email,
    this.emailVerified,
    this.profilePicture,
    this.nama,
    this.handphone,
    this.alamat,
    this.wallet,
    this.createdAt,
    this.updatedAt,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        profilePicture: json["profile_picture"],
        nama: json["nama"],
        handphone: json["handphone"],
        alamat: json["alamat"],
        wallet: json["wallet"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "email": email,
        "emailVerified": emailVerified,
        "profile_picture": profilePicture,
        "nama": nama,
        "handphone": handphone,
        "alamat": alamat,
        "wallet": wallet,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
