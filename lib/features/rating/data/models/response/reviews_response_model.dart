import 'dart:convert';

ReviewsResponse reviewResponseFromJson(String str) =>
    ReviewsResponse.fromJson(json.decode(str));

String reviewResponseToJson(ReviewsResponse data) => json.encode(data.toJson());

class ReviewsResponse {
  final String? komentar;
  final int? rating;
  final int? mitraId;
  final int? pelangganId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ReviewsResponse({
    this.komentar,
    this.rating,
    this.mitraId,
    this.pelangganId,
    this.createdAt,
    this.updatedAt,
  });

  factory ReviewsResponse.fromJson(Map<String, dynamic> json) =>
      ReviewsResponse(
        komentar: json["komentar"],
        rating: json["rating"],
        mitraId: json["mitraId"],
        pelangganId: json["pelangganId"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "komentar": komentar,
        "rating": rating,
        "mitraId": mitraId,
        "pelangganId": pelangganId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
