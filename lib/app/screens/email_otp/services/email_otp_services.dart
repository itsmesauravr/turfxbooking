import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:turfxbooking/app/screens/email_otp/model/email_otp_verification_model.dart';
import 'package:turfxbooking/app/screens/services/api_services.dart';
import 'package:turfxbooking/app/screens/services/dio_exception.dart';
import 'package:turfxbooking/app/screens/widgets/snackbar/snack_bar.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/url/url.dart';

class EmailOtpApi {
  Future<EmailOtpResponseModel?> emailOtpServices(
      EmailOtpModel data, context) async {
    log(data.toJson().toString());
    try {
      Response response = await DioApiMethods.postMethod(
        url: Url.baseUrl + Url.emailOtpUrl,
        data: data.toJson(),
      );
      if (response.statusCode == 200) {
        log(response.data.toString());
        log(response.data["token"].toString());
        return EmailOtpResponseModel.fromJson(response.data);
      }
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      SnackBarWidget.show(context, errorMessage, AppColors.kRedColor);
    }
    return null;
  }
}
