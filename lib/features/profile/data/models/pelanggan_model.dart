import 'dart:convert';
import 'package:equatable/equatable.dart';

PelangganModel pelangganModelFromJson(String str) =>
    PelangganModel.fromJson(json.decode(str));

String pelangganModelToJson(PelangganModel data) => json.encode(data.toJson());

class PelangganModel extends Equatable {
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

  PelangganModel({
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

  factory PelangganModel.fromJson(Map<String, dynamic> json) => PelangganModel(
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

  @override
  List<Object?> get props => [
        id,
        username,
        password,
        email,
        emailVerified,
        profilePicture,
        nama,
        handphone,
        alamat,
        wallet,
        createdAt,
        updatedAt,
      ];
}
