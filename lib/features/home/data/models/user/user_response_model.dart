import 'dart:convert';
import 'package:equatable/equatable.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
  final int? sub;
  final String? username;
  final String? role;
  final int? iat;
  final int? exp;

  UserModel({
    this.sub,
    this.username,
    this.role,
    this.iat,
    this.exp,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        sub: json["sub"],
        username: json["username"],
        role: json["role"],
        iat: json["iat"],
        exp: json["exp"],
      );

  Map<String, dynamic> toJson() => {
        "sub": sub,
        "username": username,
        "role": role,
        "iat": iat,
        "exp": exp,
      };

  @override
  List<Object?> get props => [sub, username, role, iat, exp];
}
