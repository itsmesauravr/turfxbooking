import 'dart:developer';

import 'package:dio/dio.dart';

class DioApiMethods {
  static Future<dynamic> postMethod({required url, required data}) async {
    log(data.toString());
    return await Dio().post(
      url,
      data: data,
    );
  }
}
