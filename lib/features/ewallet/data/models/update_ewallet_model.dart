import 'dart:convert';

UpdateEwalletModel pelangganModelFromJson(String str) =>
    UpdateEwalletModel.fromJson(json.decode(str));

String pelangganModelToJson(UpdateEwalletModel data) =>
    json.encode(data.toJson());

class UpdateEwalletModel {
  final int? wallet;

  UpdateEwalletModel({
    this.wallet,
  });

  factory UpdateEwalletModel.fromJson(Map<String, dynamic> json) =>
      UpdateEwalletModel(
        wallet: json["wallet"],
      );

  Map<String, dynamic> toJson() => {
        "wallet": wallet,
      };
}
