import 'dart:convert';

VerifyOtpResponse verifyOtpResponseFromJson(String str) =>
    VerifyOtpResponse.fromJson(json.decode(str));

String verifyOtpResponseToJson(VerifyOtpResponse data) =>
    json.encode(data.toJson());

class VerifyOtpResponse {
  final String status;
  final int userId;
  final String accessToken;

  VerifyOtpResponse({
    required this.status,
    required this.userId,
    required this.accessToken,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) =>
      VerifyOtpResponse(
        status: json["status"],
        userId: json["userId"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "userId": userId,
        "access_token": accessToken,
      };
}
