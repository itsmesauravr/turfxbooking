class EmailOtpModel {
  String? userOtp;
  String? userId;

  EmailOtpModel({
    this.userOtp,
    this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_otp": userOtp,
      "_id": userId,
    };
  }
}

class EmailOtpResponseModel {
  bool? status;
  String? token;
  String? refreshToken;
  String? message;

  EmailOtpResponseModel({
    this.status,
    this.token,
    this.refreshToken,
    this.message,
  });

  factory EmailOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return EmailOtpResponseModel(
      status: json["status"],
      token: json["token"],
      refreshToken: json["refreshToken"],
      message: json["message"],
    );
  }
}
