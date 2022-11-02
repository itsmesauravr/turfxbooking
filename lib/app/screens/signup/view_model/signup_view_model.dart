import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:turfxbooking/app/screens/signup/model/signup_model.dart';
import 'package:turfxbooking/app/screens/signup/services/signup_services.dart';
import 'package:turfxbooking/app/screens/widgets/snackbar/snack_bar.dart';

class SignUpViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailInputController = TextEditingController();
  final passwordInputController = TextEditingController();
  String? newId;
  bool isloading = false;
  bool isHidden = true;

  void formValid(context) async {
    if (formKey.currentState!.validate()) {
      log("message: form is valid");
      loadingTrue();
      await signUpOnTap(context);
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

  void loadingFalse() {
    isloading = false;
    notifyListeners();
  }

  void loadingTrue() {
    isloading = true;
    notifyListeners();
  }

  void togglePasswordView() {
    isHidden = !isHidden;
    notifyListeners();
  }

  Future<void> signUpOnTap(context) async {
    final data = SignUpModel(
      userMail: emailInputController.text,
      userPassWord: passwordInputController.text,
    );
    log(data.userMail);
    log(data.userPassWord);
    SignUpResponseModel? respone =
        await SignUpApiServices.signUpApi(data, context);
    if (respone != null) {
      newId = respone.id;
      if (respone.status = true) {
        loadingFalse();
        Navigator.pushReplacementNamed(context, "otpFormPage");
      }
    }
  }

  void disposes() {
    formKey.currentState!.reset();
    emailInputController.clear();
    passwordInputController.clear();
    isloading = false;
    isHidden = true;
    notifyListeners();
  }
}
