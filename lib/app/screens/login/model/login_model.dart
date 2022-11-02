class LoginModel {
  String userMail;
  String userPassword;

  LoginModel({
    required this.userMail,
    required this.userPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_mail": userMail,
      "user_password": userPassword,
    };
  }
}

class LoginResponseModel {
  bool? status;
  String? message;
  String? token;
  String? refreshToken;
  String? id;

  LoginResponseModel({
    this.status,
    this.message,
    this.token,
    this.refreshToken,
    this.id,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      status: json["status"],
      message: json["message"],
      token: json["token"],
      refreshToken: json["refreshToken"],
      id: json["_id"],
    );
  }
}
