import 'dart:convert';

import 'package:antria_mobile_pelanggan/features/rating/data/models/request/reviews_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ReviewsRequest', () {
    test('fromJson should create a valid ReviewsRequest object', () {
      // Arrange
      final jsonString = '''
      {
        "komentar": "Great service",
        "rating": 5,
        "mitraId": 123,
        "pelangganId": 456
      }
      ''';
      final jsonMap = json.decode(jsonString);

      // Act
      final reviewsRequest = ReviewsRequest.fromJson(jsonMap);

      // Assert
      expect(reviewsRequest.komentar, "Great service");
      expect(reviewsRequest.rating, 5);
      expect(reviewsRequest.mitraId, 123);
      expect(reviewsRequest.pelangganId, 456);
    });

    test('toJson should create a valid JSON map', () {
      // Arrange
      final reviewsRequest = ReviewsRequest(
        komentar: "Great service",
        rating: 5,
        mitraId: 123,
        pelangganId: 456,
      );

      // Act
      final jsonMap = reviewsRequest.toJson();

      // Assert
      expect(jsonMap['komentar'], "Great service");
      expect(jsonMap['rating'], 5);
      expect(jsonMap['mitraId'], 123);
      expect(jsonMap['pelangganId'], 456);
    });

    test('reviewRequestFromJson should create a valid ReviewsRequest object',
        () {
      // Arrange
      final jsonString = '''
      {
        "komentar": "Great service",
        "rating": 5,
        "mitraId": 123,
        "pelangganId": 456
      }
      ''';

      // Act
      final reviewsRequest = reviewRequestFromJson(jsonString);

      // Assert
      expect(reviewsRequest.komentar, "Great service");
      expect(reviewsRequest.rating, 5);
      expect(reviewsRequest.mitraId, 123);
      expect(reviewsRequest.pelangganId, 456);
    });

    test('reviewRequestToJson should create a valid JSON string', () {
      // Arrange
      final reviewsRequest = ReviewsRequest(
        komentar: "Great service",
        rating: 5,
        mitraId: 123,
        pelangganId: 456,
      );

      // Act
      final jsonString = reviewRequestToJson(reviewsRequest);

      // Assert
      final jsonMap = json.decode(jsonString);
      expect(jsonMap['komentar'], "Great service");
      expect(jsonMap['rating'], 5);
      expect(jsonMap['mitraId'], 123);
      expect(jsonMap['pelangganId'], 456);
    });

    test('Equatable props should be correct', () {
      // Arrange
      final reviewsRequest1 = ReviewsRequest(
        komentar: "Great service",
        rating: 5,
        mitraId: 123,
        pelangganId: 456,
      );
      final reviewsRequest2 = ReviewsRequest(
        komentar: "Great service",
        rating: 5,
        mitraId: 123,
        pelangganId: 456,
      );

      // Act & Assert
      expect(reviewsRequest1 == reviewsRequest2, true);
    });
  });
}
