import 'dart:convert';

UpdatePelangganRequestModel updatePelangganRequestModelFromJson(String str) =>
    UpdatePelangganRequestModel.fromJson(json.decode(str));

String updatePelangganRequestModelToJson(UpdatePelangganRequestModel data) =>
    json.encode(data.toJson());

class UpdatePelangganRequestModel {
  final String? username;
  final String? email;
  final String? profilePicture;
  final String? nama;
  final String? handphone;
  final String? alamat;

  UpdatePelangganRequestModel({
    this.username,
    this.email,
    this.profilePicture,
    this.nama,
    this.handphone,
    this.alamat,
  });

  factory UpdatePelangganRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdatePelangganRequestModel(
        username: json["username"],
        email: json["email"],
        profilePicture: json["profile_picture"],
        nama: json["nama"],
        handphone: json["handphone"],
        alamat: json["alamat"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "profile_picture": profilePicture,
        "nama": nama,
        "handphone": handphone,
        "alamat": alamat,
      };
}
