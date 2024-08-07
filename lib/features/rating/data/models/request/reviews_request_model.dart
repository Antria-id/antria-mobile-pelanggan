import 'dart:convert';
import 'package:equatable/equatable.dart';

ReviewsRequest reviewRequestFromJson(String str) =>
    ReviewsRequest.fromJson(json.decode(str));

String reviewRequestToJson(ReviewsRequest data) => json.encode(data.toJson());

class ReviewsRequest extends Equatable {
  final String? komentar;
  final int? rating;
  final int? mitraId;
  int? pelangganId;

  ReviewsRequest({
    this.komentar,
    this.rating,
    this.mitraId,
    this.pelangganId,
  });

  factory ReviewsRequest.fromJson(Map<String, dynamic> json) => ReviewsRequest(
        komentar: json["komentar"],
        rating: json["rating"],
        mitraId: json["mitraId"],
        pelangganId: json["pelangganId"],
      );

  Map<String, dynamic> toJson() => {
        "komentar": komentar,
        "rating": rating,
        "mitraId": mitraId,
        "pelangganId": pelangganId,
      };

  @override
  List<Object?> get props => [komentar, rating, mitraId, pelangganId];
}
