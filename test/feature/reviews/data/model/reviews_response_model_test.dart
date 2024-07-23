import 'dart:convert';

import 'package:antria_mobile_pelanggan/features/rating/data/models/response/reviews_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReviewsResponse', () {
    test('fromJson should parse JSON correctly', () {
      final jsonString = '''
      {
        "komentar": "Great service",
        "rating": 5,
        "mitraId": 123,
        "pelangganId": 456,
        "created_at": "2023-07-21T10:00:00.000Z",
        "updated_at": "2023-07-22T10:00:00.000Z"
      }
      ''';

      final review = reviewResponseFromJson(jsonString);

      expect(review.komentar, "Great service");
      expect(review.rating, 5);
      expect(review.mitraId, 123);
      expect(review.pelangganId, 456);
      expect(review.createdAt, DateTime.parse("2023-07-21T10:00:00.000Z"));
      expect(review.updatedAt, DateTime.parse("2023-07-22T10:00:00.000Z"));
    });

    test('toJson should convert object to JSON correctly', () {
      final review = ReviewsResponse(
        komentar: "Great service",
        rating: 5,
        mitraId: 123,
        pelangganId: 456,
        createdAt: DateTime.parse("2023-07-21T10:00:00.000Z"),
        updatedAt: DateTime.parse("2023-07-22T10:00:00.000Z"),
      );

      final jsonString = reviewResponseToJson(review);
      final expectedJsonString = '''
      {
        "komentar": "Great service",
        "rating": 5,
        "mitraId": 123,
        "pelangganId": 456,
        "created_at": "2023-07-21T10:00:00.000Z",
        "updated_at": "2023-07-22T10:00:00.000Z"
      }
      ''';

      // Decode both JSON strings to map for comparison
      final jsonMap = json.decode(jsonString);
      final expectedJsonMap = json.decode(expectedJsonString);

      expect(jsonMap, expectedJsonMap);
    });

    test('Equatable props', () {
      final review1 = ReviewsResponse(
        komentar: "Great service",
        rating: 5,
        mitraId: 123,
        pelangganId: 456,
        createdAt: DateTime.parse("2023-07-21T10:00:00.000Z"),
        updatedAt: DateTime.parse("2023-07-22T10:00:00.000Z"),
      );

      final review2 = ReviewsResponse(
        komentar: "Great service",
        rating: 5,
        mitraId: 123,
        pelangganId: 456,
        createdAt: DateTime.parse("2023-07-21T10:00:00.000Z"),
        updatedAt: DateTime.parse("2023-07-22T10:00:00.000Z"),
      );

      expect(review1 == review2, isTrue);
    });
  });
}
