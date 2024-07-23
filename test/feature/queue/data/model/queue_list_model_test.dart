import 'package:antria_mobile_pelanggan/features/queue/data/models/queue_list_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';

void main() {
  group('QueueListModel', () {
    test('should correctly parse JSON to QueueListModel', () {
      final jsonString = '''
      {
        "id": 1,
        "estimasi": 30,
        "orderstatus": "completed",
        "pesananId": "12345",
        "created_at": "2024-07-21T12:00:00Z",
        "updated_at": "2024-07-22T12:00:00Z"
      }
      ''';

      final jsonMap = json.decode(jsonString);
      final queueListModel = QueueListModel.fromJson(jsonMap);

      expect(queueListModel.id, 1);
      expect(queueListModel.estimasi, 30);
      expect(queueListModel.orderstatus, 'completed');
      expect(queueListModel.pesananId, '12345');
      expect(queueListModel.createdAt, DateTime.parse('2024-07-21T12:00:00Z'));
      expect(queueListModel.updatedAt, DateTime.parse('2024-07-22T12:00:00Z'));
    });

    test('should correctly convert QueueListModel to JSON', () {
      final queueListModel = QueueListModel(
        id: 1,
        estimasi: 30,
        orderstatus: 'completed',
        pesananId: '12345',
        createdAt: DateTime.parse('2024-07-21T12:00:00Z'),
        updatedAt: DateTime.parse('2024-07-22T12:00:00Z'),
      );

      final jsonString = queueListModelToJson([queueListModel]);
      final expectedJsonString = '''
      [
        {
          "id": 1,
          "estimasi": 30,
          "orderstatus": "completed",
          "pesananId": "12345",
          "created_at": "2024-07-21T12:00:00.000Z",
          "updated_at": "2024-07-22T12:00:00.000Z"
        }
      ]
      ''';

      expect(json.decode(jsonString), json.decode(expectedJsonString));
    });

    test('should correctly handle null values in fromJson', () {
      final jsonString = '''
      {
        "id": null,
        "estimasi": null,
        "orderstatus": null,
        "pesananId": null,
        "created_at": null,
        "updated_at": null
      }
      ''';

      final jsonMap = json.decode(jsonString);
      final queueListModel = QueueListModel.fromJson(jsonMap);

      expect(queueListModel.id, isNull);
      expect(queueListModel.estimasi, isNull);
      expect(queueListModel.orderstatus, isNull);
      expect(queueListModel.pesananId, isNull);
      expect(queueListModel.createdAt, isNull);
      expect(queueListModel.updatedAt, isNull);
    });

    test('should correctly handle null values in toJson', () {
      final queueListModel = QueueListModel();

      final jsonString = json.encode(queueListModel.toJson());
      final expectedJsonString = '''
      {
        "id": null,
        "estimasi": null,
        "orderstatus": null,
        "pesananId": null,
        "created_at": null,
        "updated_at": null
      }
      ''';

      expect(json.decode(jsonString), json.decode(expectedJsonString));
    });
  });
}
