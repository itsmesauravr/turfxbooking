import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/home/model/home_model.dart';
import 'package:turfxbooking/app/screens/home/services/location_services.dart';
import 'package:turfxbooking/app/screens/services/dio_intreceptors.dart';
import 'package:turfxbooking/app/screens/services/dio_exception.dart';
import 'package:turfxbooking/app/screens/widgets/snackbar/snack_bar.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/url/url.dart';

class HomeService {
  Future<HomeResponse?> fetchData(context) async {
    try {
      String district = Provider.of<LocationServices>(context, listen: false)
          .currentDistrict
          .toString();
      Dio dio = await InterceptorHelper().getApiClient();
      Response response = await dio.get(Url.getAllDetails + district);
      if (response.statusCode! >= 200 && response.statusCode! <= 299) {
        return HomeResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      final errorMessage = DioException.fromDioError(e).toString();
      SnackBarWidget.show(context, errorMessage, AppColors.kRedColor);
    }
    return null;
  }
}
