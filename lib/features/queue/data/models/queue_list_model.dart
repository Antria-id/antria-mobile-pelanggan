import 'dart:convert';

import 'package:antria_mobile_pelanggan/features/history/data/models/done_order/detail_transaction_model.dart';

List<QueueListModel> queueListModelFromJson(String str) =>
    List<QueueListModel>.from(
        json.decode(str).map((x) => QueueListModel.fromJson(x)));

String queueListModelToJson(List<QueueListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QueueListModel {
  final int? id;
  final int? estimasi;
  final String? orderstatus;
  final String? pesananId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  DetailTransactionModel? detailTransactionModel;

  QueueListModel({
    this.id,
    this.estimasi,
    this.orderstatus,
    this.pesananId,
    this.createdAt,
    this.updatedAt,
    this.detailTransactionModel,
  });

  factory QueueListModel.fromJson(Map<String, dynamic> json) => QueueListModel(
        id: json["id"],
        estimasi: json["estimasi"],
        orderstatus: json["orderstatus"],
        pesananId: json["pesananId"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "estimasi": estimasi,
        "orderstatus": orderstatus,
        "pesananId": pesananId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
