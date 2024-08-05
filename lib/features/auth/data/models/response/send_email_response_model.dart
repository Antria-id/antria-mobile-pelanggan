import 'dart:convert';

SendEmailResponse sendEmailResponseFromJson(String str) =>
    SendEmailResponse.fromJson(json.decode(str));

String sendEmailResponseToJson(SendEmailResponse data) =>
    json.encode(data.toJson());

class SendEmailResponse {
  final String status;

  SendEmailResponse({
    required this.status,
  });

  factory SendEmailResponse.fromJson(Map<String, dynamic> json) =>
      SendEmailResponse(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}
