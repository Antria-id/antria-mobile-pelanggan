import 'dart:convert';
import 'package:equatable/equatable.dart';

List<GetRestaurantResponse> getRestaurantResponseFromJson(String str) =>
    List<GetRestaurantResponse>.from(
        json.decode(str).map((x) => GetRestaurantResponse.fromJson(x)));

String getRestaurantResponseToJson(List<GetRestaurantResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetRestaurantResponse extends Equatable {
  final int? review;
  final int? id;
  final String? namaToko;
  final String? deskripsiToko;
  final String? alamat;
  final String? linkGmaps;
  final String? hariBuka;
  final String? jamBuka;
  final String? jamTutup;
  final String? gambarToko;
  final bool? subscription;
  final String? statusToko;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GetRestaurantResponse({
    this.review,
    this.id,
    this.namaToko,
    this.deskripsiToko,
    this.alamat,
    this.linkGmaps,
    this.hariBuka,
    this.jamBuka,
    this.jamTutup,
    this.gambarToko,
    this.subscription,
    this.statusToko,
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
        linkGmaps: json["linkGmaps"],
        hariBuka: json["hari_buka"],
        jamBuka: json["jam_buka"],
        jamTutup: json["jam_tutup"],
        gambarToko: json["gambar_toko"],
        subscription: json["subscription"],
        statusToko: json["status_toko"],
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
        "linkGmaps": linkGmaps,
        "hari_buka": hariBuka,
        "jam_buka": jamBuka,
        "jam_tutup": jamTutup,
        "gambar_toko": gambarToko,
        "subscription": subscription,
        "status_toko": statusTokoValues.reverse[statusToko],
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
        linkGmaps,
        hariBuka,
        jamBuka,
        jamTutup,
        gambarToko,
        subscription,
        statusToko,
        createdAt,
        updatedAt,
      ];
}

enum StatusToko { CLOSE, OPEN, FULL }

final statusTokoValues = EnumValues({
  "CLOSE": StatusToko.CLOSE,
  "OPEN": StatusToko.OPEN,
  "FULL": StatusToko.FULL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
