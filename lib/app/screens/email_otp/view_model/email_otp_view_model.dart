import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:turfxbooking/app/screens/email_otp/model/email_otp_verification_model.dart';
import 'package:turfxbooking/app/screens/email_otp/services/email_otp_services.dart';
import 'package:turfxbooking/app/screens/widgets/snackbar/snack_bar.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';

class EmailOtpViewModel extends ChangeNotifier {
  final textEditingControllerOne = TextEditingController();
  final textEditingControllerTwo = TextEditingController();
  final textEditingControllerThree = TextEditingController();
  final textEditingControllerFour = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> verifyOtp(id, context) async {
    final otp = {
      textEditingControllerOne.text +
          textEditingControllerTwo.text +
          textEditingControllerThree.text +
          textEditingControllerFour.text
    };
    final otpString = otp.join().toString();
    log("otpTotalString: $otpString");

    EmailOtpModel data = EmailOtpModel(
      userId: id,
      userOtp: otpString,
    );
    final result = await EmailOtpApi().emailOtpServices(data, context);
    log(result.toString());
    if (result != null) {
      if (result.status == true) {
        storage.write(key: "token", value: result.token);
        storage.write(key: "refreshToken", value: result.refreshToken);
        Navigator.pushReplacementNamed(
          context,
          "homePage",
        );
        SnackBarWidget.show(
          context,
          "Successfully registered",
          AppColors.kGreenColor,
        );
      }
    }
  }
}
