import 'package:antria_mobile_pelanggan/features/ewallet/data/models/update_ewallet_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UpdateEwalletModel', () {
    test('fromJson should parse JSON correctly', () {
      // Given
      const jsonString = '{"wallet": 100}';

      // When
      final model = pelangganModelFromJson(jsonString);

      // Then
      expect(model.wallet, 100);
    });

    test('toJson should convert model to JSON correctly', () {
      // Given
      final model = UpdateEwalletModel(wallet: 200);

      // When
      final jsonString = pelangganModelToJson(model);

      // Then
      final expectedJsonString = '{"wallet":200}';
      expect(jsonString, expectedJsonString);
    });

    test('fromJson should handle null values correctly', () {
      // Given
      const jsonString = '{"wallet": null}';

      // When
      final model = pelangganModelFromJson(jsonString);

      // Then
      expect(model.wallet, isNull);
    });

    test('toJson should handle null values correctly', () {
      // Given
      final model = UpdateEwalletModel(wallet: null);

      // When
      final jsonString = pelangganModelToJson(model);

      // Then
      final expectedJsonString = '{"wallet":null}';
      expect(jsonString, expectedJsonString);
    });
  });
}
