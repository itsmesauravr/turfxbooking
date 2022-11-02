import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/login/view_model/login_view_model.dart';
import 'package:turfxbooking/app/screens/widgets/button/button.dart';
import 'package:turfxbooking/app/screens/widgets/divider/divider.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/screens/widgets/otp_mobile_box.dart/otp_mobile_box.dart';
import 'package:turfxbooking/app/screens/widgets/text_button/text_button.dart';
import 'package:turfxbooking/app/screens/widgets/text_form_field/text_form_field.dart';
import 'package:turfxbooking/app/screens/widgets/validation/email_validatiom.dart';
import 'package:turfxbooking/app/screens/widgets/validation/password_validation.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class LoginContainerBox extends StatelessWidget {
  const LoginContainerBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final logInPro = Provider.of<LogInViewModel>(context);
    return Positioned(
        bottom: 28,
        left: 30,
        child: SizedBox(
          height: size.height * 6 / 10,
          width: size.width * 8.5 / 10,
          child: NewBox(
            child: Form(
              key: logInPro.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AppSizedBox.kHeight10,
                    TextFormFieldWiget(
                      controller: logInPro.emailEditingController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      validator: EmailValidation.emailValid(),
                      labelText: "Email",
                    ),
                    TextFormFieldWiget(
                      controller: logInPro.passWordEditingController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: logInPro.isHidden,
                      suffixIcon: Consumer<LogInViewModel>(
                        builder: (context, value, _) {
                          return IconButton(
                            onPressed: () {
                              value.togglePasswordView();
                            },
                            icon: Icon(
                              value.isHidden
                                  ? (Icons.visibility)
                                  : (Icons.visibility_off),
                            ),
                          );
                        },
                      ),
                      validator: PassWordValidation.passWordValid(),
                      labelText: "Password",
                    ),
                    AppSizedBox.kHeight10,
                    Consumer<LogInViewModel>(builder: (context, value, _) {
                      return logInPro.isloading
                          ? const CircularProgressIndicator(
                              color: Colors.red,
                            )
                          : ButtonWidget(
                              onPressed: () {
                                logInPro.formValid(context);
                              },
                              text: "Log In",
                              color: AppColors.kBlackColor,
                            );
                    }),
                    AppSizedBox.kHeight20,
                    const DividerWidget(),
                    AppSizedBox.kHeight20,
                    const MobileOtpWidget(),
                    TextButtonWidget(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          "signUpPage",
                        );
                      },
                      text: "Create an account",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
