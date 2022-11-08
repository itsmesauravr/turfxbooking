import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/booking/view/booking_screen.dart';
import 'package:turfxbooking/app/screens/booking/view_model/booking_view_model.dart';
import 'package:turfxbooking/app/screens/details/widgets/text_details.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class BottomBoxWidget extends StatelessWidget {
  BottomBoxWidget({super.key, required this.selectedIndex});

  final int selectedIndex;
  final railWayTime = int.parse(DateFormat.H().format(DateTime.now()));
  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeViewModel>(context);
    final bookPro = Provider.of<BookingViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: NewBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
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
                    AppSizedBox.kHeight20,
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
                    AppSizedBox.kHeight20,
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingScreenWidget(
                              selectedIndex: selectedIndex,
                            ),
                          ),
                        );
                        bookPro.disposes();
                        bookPro.totalSlot(selectedIndex, context, railWayTime);
                      },
                      child: SizedBox(
                        height: size.height * 0.08,
                        child: NewBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Book Your Turf",
                              style: TextStyle(color: AppColors.kRedColor),
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
