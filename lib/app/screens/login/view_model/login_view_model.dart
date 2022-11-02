import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:turfxbooking/app/screens/login/model/login_model.dart';
import 'package:turfxbooking/app/screens/login/services/login_service.dart';
import 'package:turfxbooking/app/screens/widgets/snackbar/snack_bar.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';

class LogInViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailEditingController = TextEditingController();
  final passWordEditingController = TextEditingController();
  bool isloading = false;
  bool isHidden = true;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> formValid(context) async {
    if (formKey.currentState!.validate()) {
      log("message: form is valid");
      loadingTrue();
      await loginOnTap(context);
      disposes();
    } else {
      log("message:form is not valid");
      SnackBarWidget.show(
        context,
        "Please enter valid email and password",
        Colors.red,
      );
    }
    loadingFalse();
  }

  Future<void> loginOnTap(context) async {
    final data = LoginModel(
      userMail: emailEditingController.text.trim(),
      userPassword: passWordEditingController.text.trim(),
    );
    log(data.userMail);
    log(data.userPassword);
    final response = await LoginApiServices.loginApi(data, context);
    if (response != null) {
      if (response.status = true) {
        storage.write(key: "token", value: response.token);
        storage.write(key: "refreshToken", value: response.refreshToken);
        Navigator.pushReplacementNamed(context, "homePage");
        SnackBarWidget.show(
          context,
          "Login Successfully",
          AppColors.kBlueColor,
        );
      }
    } else {
      SnackBarWidget.show(
        context,
        "User not registered",
        AppColors.kRedColor,
      );
    }
    loadingFalse();
  }

  void loadingFalse() {
    isloading = false;
    notifyListeners();
  }

  void loadingTrue() {
    isloading = true;
    notifyListeners();
  }

  //Make text obscure for password

  void togglePasswordView() {
    isHidden = !isHidden;
    notifyListeners();
  }

  void disposes() {
    formKey.currentState!.reset();
    emailEditingController.clear();
    passWordEditingController.clear();
    isloading = false;
    isHidden = true;
    notifyListeners();
  }
}
