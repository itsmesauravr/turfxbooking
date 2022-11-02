import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:turfxbooking/app/screens/services/api_services.dart';
import 'package:turfxbooking/app/screens/services/dio_exception.dart';
import 'package:turfxbooking/app/screens/signup/model/signup_model.dart';
import 'package:turfxbooking/app/screens/widgets/snackbar/snack_bar.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/url/url.dart';

class SignUpApiServices {
  static Future<SignUpResponseModel?> signUpApi(
      SignUpModel data, context) async {
    try {
      Response response = await DioApiMethods.postMethod(
        url: Url.baseUrl + Url.signUpUrl,
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        log(response.data.toString());
        log(response.data["id"].toString());
        return SignUpResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      SnackBarWidget.show(context, errorMessage, AppColors.kRedColor);
    } catch (e) {
      throw e.toString();
    }
    return null;
  }
}
