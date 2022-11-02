import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/signup/view_model/signup_view_model.dart';
import 'package:turfxbooking/app/screens/widgets/button/button.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/screens/widgets/text_button/text_button.dart';
import 'package:turfxbooking/app/screens/widgets/text_form_field/text_form_field.dart';
import 'package:turfxbooking/app/screens/widgets/validation/email_validatiom.dart';
import 'package:turfxbooking/app/screens/widgets/validation/password_validation.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class SignUpContainerBox extends StatelessWidget {
  const SignUpContainerBox({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final signupPro = Provider.of<SignUpViewModel>(context);
    return Positioned(
      bottom: 28,
      left: 30,
      child: SizedBox(
        height: size.height * 6 / 10,
        width: size.width * 8.5 / 10,
        child: NewBox(
          child: Form(
            key: signupPro.formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppSizedBox.kHeight20,
                  TextFormFieldWiget(
                    labelText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                    validator: EmailValidation.emailValid(),
                    controller: signupPro.emailInputController,
                  ),
                  AppSizedBox.kHeight10,
                  TextFormFieldWiget(
                    labelText: "Password",
                    obscureText: signupPro.isHidden,
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: Consumer<SignUpViewModel>(
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
                    controller: signupPro.passwordInputController,
                  ),
                  AppSizedBox.kHeight20,
                  Consumer<SignUpViewModel>(builder: (context, value, _) {
                    return signupPro.isloading
                        ? const CircularProgressIndicator(
                            color: Colors.red,
                          )
                        : ButtonWidget(
                            onPressed: () {
                              signupPro.formValid(context);
                            },
                            text: "Sign Up",
                            color: AppColors.kBlackColor,
                          );
                  }),
                  AppSizedBox.kHeight20,
                  TextButtonWidget(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: "Already have an account? Log In",
                  ),
                  AppSizedBox.kHeight20,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
