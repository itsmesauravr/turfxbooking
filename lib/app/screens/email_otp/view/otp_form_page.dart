import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/email_otp/view_model/email_otp_view_model.dart';
import 'package:turfxbooking/app/screens/email_otp/view/widgets/text_field_widget.dart';
import 'package:turfxbooking/app/screens/signup/view_model/signup_view_model.dart';
import 'package:turfxbooking/app/screens/widgets/button/button.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/images/images.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class OtpFormPage extends StatelessWidget {
  const OtpFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final otpPro = Provider.of<EmailOtpViewModel>(context);
    final signUpPro = Provider.of<SignUpViewModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kBackGroundColor,
        body: Form(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: NewBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppSizedBox.kHeight20,
                  SizedBox(
                    height: 180,
                    width: 180,
                    child: NewBox(
                      child: Image.asset(
                        AppImages.kMailImage,
                        height: 150,
                        width: 150,
                      ),
                    ),
                  ),
                  AppSizedBox.kHeight20,
                  Text(
                    "We have sent you a verification code on your email",
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.kGreyColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  AppSizedBox.kHeight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFieldWidget(
                        controller: otpPro.textEditingControllerOne,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                        },
                      ),
                      TextFieldWidget(
                        controller: otpPro.textEditingControllerTwo,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                      TextFieldWidget(
                        controller: otpPro.textEditingControllerThree,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                      TextFieldWidget(
                        controller: otpPro.textEditingControllerFour,
                        onChanged: (value) {
                          if (value.length == 1) {
                            FocusScope.of(context).nextFocus();
                            FocusManager.instance.primaryFocus?.unfocus();
                          }
                          if (value.isEmpty) {
                            FocusScope.of(context).previousFocus();
                          }
                        },
                      ),
                    ],
                  ),
                  AppSizedBox.kHeight30,
                  SizedBox(
                    height: 250,
                    width: 250,
                    child: NewBox(
                      child: Image.asset(
                        AppImages.kBottomMailImage,
                      ),
                    ),
                  ),
                  AppSizedBox.kHeight30,
                  ButtonWidget(
                    onPressed: () {
                      otpPro.verifyOtp(signUpPro.newId, context);
                      log("id : ${signUpPro.newId}");
                    },
                    text: "Verify & Proceed",
                    color: AppColors.kBlueColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive the OTP?",
                        style: TextStyle(
                          color: AppColors.kGreyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Resend OTP",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
