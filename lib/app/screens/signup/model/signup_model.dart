class SignUpModel {
  String userMail;
  String userPassWord;

  SignUpModel({
    required this.userMail,
    required this.userPassWord,
  });

  Map<String, dynamic> toJson() {
    return {
      "user_mail": userMail,
      "user_password": userPassWord,
    };
  }
}

class SignUpResponseModel {
  bool status;
  String id;
  String? message;

  SignUpResponseModel({
    required this.status,
    required this.id,
    this.message,
  });
  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(
      status: json["status"] ?? false,
      id: json["id"] ?? "",
      message: json["message"] ?? "",
    );
  }
}
