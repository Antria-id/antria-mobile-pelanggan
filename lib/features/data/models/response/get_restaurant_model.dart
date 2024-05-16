import 'dart:convert';

List<GetRestaurantResponse> getRestaurantResponseFromJson(String str) =>
    List<GetRestaurantResponse>.from(
        json.decode(str).map((x) => GetRestaurantResponse.fromJson(x)));

String getRestaurantResponseToJson(List<GetRestaurantResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetRestaurantResponse {
  final int? id;
  final String? namaToko;
  final String? deskripsiToko;
  final String? alamat;
  final String? hariBuka;
  final String? jamBuka;
  final String? jamTutup;
  final String? gambarToko;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GetRestaurantResponse({
    this.id,
    this.namaToko,
    this.deskripsiToko,
    this.alamat,
    this.hariBuka,
    this.jamBuka,
    this.jamTutup,
    this.gambarToko,
    this.createdAt,
    this.updatedAt,
  });

  factory GetRestaurantResponse.fromJson(Map<String, dynamic> json) =>
      GetRestaurantResponse(
        id: json["id"],
        namaToko: json["nama_toko"],
        deskripsiToko: json["deskripsi_toko"],
        alamat: json["alamat"],
        hariBuka: json["hari_buka"],
        jamBuka: json["jam_buka"],
        jamTutup: json["jam_tutup"],
        gambarToko: json["gambar_toko"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_toko": namaToko,
        "deskripsi_toko": deskripsiToko,
        "alamat": alamat,
        "hari_buka": hariBuka,
        "jam_buka": jamBuka,
        "jam_tutup": jamTutup,
        "gambar_toko": gambarToko,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
