import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/booking/view/view_model/booking_view_model.dart';
import 'package:turfxbooking/app/screens/email_otp/view/otp_form_page.dart';
import 'package:turfxbooking/app/screens/home/services/location_services.dart';
import 'package:turfxbooking/app/screens/home/view/home_page.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';
import 'package:turfxbooking/app/screens/login/view/login_page.dart';
import 'package:turfxbooking/app/screens/login/view_model/login_view_model.dart';
import 'package:turfxbooking/app/screens/signup/view/signup_page.dart';
import 'package:turfxbooking/app/screens/signup/view_model/signup_view_model.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'app/screens/email_otp/view_model/email_otp_view_model.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: AppColors.kBackGroundColor,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LogInViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => EmailOtpViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationServices(context),
        ),
        ChangeNotifierProvider(
          create: (context) => BookingViewModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        initialRoute: "logInPage",
        routes: {
          "logInPage": (context) => const LogInPage(),
          "signUpPage": (context) => const SignUpPage(),
          "otpFormPage": (context) => const OtpFormPage(),
          "homePage": (context) => const HomePage(),
        },
      ),
    );
  }
}
