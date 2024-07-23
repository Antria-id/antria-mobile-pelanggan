import 'dart:convert';
import 'package:equatable/equatable.dart';

GetRestaurantResponse getRestaurantResponseFromJson(String str) =>
    GetRestaurantResponse.fromJson(json.decode(str));

String getRestaurantResponseToJson(GetRestaurantResponse data) =>
    json.encode(data.toJson());

class GetRestaurantResponse extends Equatable {
  final int? review;
  final int? id;
  final String? namaToko;
  final String? deskripsiToko;
  final String? alamat;
  final String? hariBuka;
  final String? jamBuka;
  final String? jamTutup;
  String? statusToko;
  final String? gambarToko;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GetRestaurantResponse({
    this.review,
    this.id,
    this.namaToko,
    this.deskripsiToko,
    this.alamat,
    this.hariBuka,
    this.jamBuka,
    this.jamTutup,
    this.statusToko,
    this.gambarToko,
    this.createdAt,
    this.updatedAt,
  });

  factory GetRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      GetRestaurantResponse(
        review: json["review"],
        id: json["id"],
        namaToko: json["nama_toko"],
        deskripsiToko: json["deskripsi_toko"],
        alamat: json["alamat"],
        hariBuka: json["hari_buka"],
        jamBuka: json["jam_buka"],
        jamTutup: json["jam_tutup"],
        statusToko: json["status_toko"],
        gambarToko: json["gambar_toko"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "review": review,
        "id": id,
        "nama_toko": namaToko,
        "deskripsi_toko": deskripsiToko,
        "alamat": alamat,
        "hari_buka": hariBuka,
        "jam_buka": jamBuka,
        "jam_tutup": jamTutup,
        "status_toko": statusToko,
        "gambar_toko": gambarToko,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        review,
        id,
        namaToko,
        deskripsiToko,
        alamat,
        hariBuka,
        jamBuka,
        jamTutup,
        statusToko,
        gambarToko,
        createdAt,
        updatedAt,
      ];
}
