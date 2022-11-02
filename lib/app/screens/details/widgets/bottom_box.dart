import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/booking/view/booking_screen.dart';
import 'package:turfxbooking/app/screens/details/widgets/text_details.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class BottomBoxWidget extends StatelessWidget {
  const BottomBoxWidget({super.key, required this.selectedIndex});

  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeViewModel>(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NewBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    NewBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Turf Type",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AppSizedBox.kHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Type ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    )),
                                Text(
                                  homePro.homeDatas[selectedIndex].turfType!
                                                  .turfSevens ==
                                              true &&
                                          homePro.homeDatas[selectedIndex]
                                                  .turfType!.turfSixes ==
                                              true
                                      ? " 7s & 6s"
                                      : homePro.homeDatas[selectedIndex]
                                                  .turfType!.turfSevens ==
                                              true
                                          ? " 7s"
                                          : " 6s",
                                  style: TextStyle(
                                    color: AppColors.kBlackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSizedBox.kHeight10,
                    NewBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Turf Amenities",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AppSizedBox.kHeight10,
                            TextDetailsWidgets(
                              selectedIndex: selectedIndex,
                              text: "1. Cafeteria ",
                              text2: homePro.homeDatas[selectedIndex]
                                          .turfAmenities!.turfCafeteria ==
                                      true
                                  ? " Available"
                                  : "Not Available",
                            ),
                            AppSizedBox.kHeight5,
                            TextDetailsWidgets(
                              selectedIndex: selectedIndex,
                              text: "2. Parking ",
                              text2: homePro.homeDatas[selectedIndex]
                                          .turfAmenities!.turfParking ==
                                      true
                                  ? " Available"
                                  : "Not Available",
                            ),
                            AppSizedBox.kHeight5,
                            TextDetailsWidgets(
                              selectedIndex: selectedIndex,
                              text: "3. Washroom ",
                              text2: homePro.homeDatas[selectedIndex]
                                          .turfAmenities!.turfWashroom ==
                                      true
                                  ? " Available"
                                  : "Not Available",
                            ),
                            AppSizedBox.kHeight5,
                            TextDetailsWidgets(
                              selectedIndex: selectedIndex,
                              text: "4. Gallery ",
                              text2: homePro.homeDatas[selectedIndex]
                                          .turfAmenities!.turfGallery ==
                                      true
                                  ? " Available"
                                  : "Not Available",
                            ),
                            AppSizedBox.kHeight5,
                            TextDetailsWidgets(
                              selectedIndex: selectedIndex,
                              text: "5. Water ",
                              text2: homePro.homeDatas[selectedIndex]
                                          .turfAmenities!.turfWater ==
                                      true
                                  ? " Available"
                                  : "Not Available",
                            ),
                            AppSizedBox.kHeight5,
                            TextDetailsWidgets(
                              selectedIndex: selectedIndex,
                              text: "6. Dressing ",
                              text2: homePro.homeDatas[selectedIndex]
                                          .turfAmenities!.turfDressing ==
                                      true
                                  ? " Available"
                                  : "Not Available",
                            ),
                            AppSizedBox.kHeight10,
                          ],
                        ),
                      ),
                    ),
                    AppSizedBox.kHeight10,
                    NewBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Turf Timings",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            AppSizedBox.kHeight10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Timings ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  " 5:00 AM - 12:00 AM",
                                  style: TextStyle(
                                    color: AppColors.kBlackColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppSizedBox.kHeight10,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingScreenWidget(
                                selectedIndex: selectedIndex),
                          ),
                        );
                      },
                      child: NewBox(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Book your court",
                            style: TextStyle(
                              color: AppColors.kRedColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
