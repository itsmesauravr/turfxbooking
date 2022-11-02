import 'package:flutter/cupertino.dart';
import 'package:turfxbooking/app/screens/home/model/home_model.dart';
import 'package:turfxbooking/app/screens/home/services/home_api.dart';

class HomeViewModel extends ChangeNotifier {
  int selectedIndex = 0;
  PageController controller = PageController();

  void navigatedBottomBar(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  List<Datum> homeDatas = [];
  Future<void> getHomeData(context) async {
    HomeResponse? response = await HomeService().fetchData(context);
    if (response != null) {
      homeDatas.clear();
      homeDatas.addAll(response.data!);
      notifyListeners();
    } else {
      homeDatas = [];
    }
  }
}
