import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:turfxbooking/app/screens/login/model/login_model.dart';
import 'package:turfxbooking/app/screens/services/api_services.dart';
import 'package:turfxbooking/app/screens/services/dio_exception.dart';
import 'package:turfxbooking/app/screens/widgets/snackbar/snack_bar.dart';
import 'package:turfxbooking/app/utils/url/url.dart';

class LoginApiServices {
  static Future<LoginResponseModel?> loginApi(LoginModel data, context) async {
    try {
      Response response = await DioApiMethods.postMethod(
        url: Url.baseUrl + Url.logInUrl,
        data: data.toJson(),
      );
      log(response.data.toString());
      if (response.statusCode == 200) {
        return LoginResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      SnackBarWidget.show(context, errorMessage, Colors.red);
    } catch (e) {
      throw e.toString();
    }
    return null;
  }
}
