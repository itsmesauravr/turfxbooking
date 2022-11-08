import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/booking/view_model/booking_view_model.dart';
import 'package:turfxbooking/app/screens/booking/widgets/top_box_details.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/screens/widgets/snackbar/snack_bar.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class BookingScreenWidget extends StatelessWidget {
  BookingScreenWidget({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;
  final List<dynamic> addSlotsMorning = [];
  final List<dynamic> addSlotsAfternoon = [];
  final List<dynamic> addSlotsEvening = [];

  final railWayTime = int.parse(DateFormat.H().format(DateTime.now()));
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homePro = Provider.of<HomeViewModel>(context);
    final bookPro = Provider.of<BookingViewModel>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.399,
                width: size.width,
                child: NewBox(
                  child: NewBox(
                    child: TopBoxDetailsWidget(
                      selectedIndex: selectedIndex,
                    ),
                  ),
                ),
              ),
              AppSizedBox.kHeight10,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: size.height * 0.45,
                    width: size.width,
                    child: NewBox(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.wb_twighlight,
                                        color: Colors.yellow.shade800,
                                      ),
                                      AppSizedBox.kWidth5,
                                      const Text(
                                        "Morning",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.41,
                                      ),
                                      Text(
                                        "Price : ${homePro.homeDatas[selectedIndex].turfPrice!.morningPrice.toString()} Rs",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.yellow.shade900,
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppSizedBox.kHeight20,
                                  GridView.builder(
                                    itemCount: bookPro.morningTime.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1.75,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 20,
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          if (addSlotsMorning.contains(
                                              bookPro.morningTime[index])) {
                                            addSlotsMorning.remove(
                                              bookPro.morningTime[index],
                                            );
                                          } else {
                                            bookPro.slotStatus.last <=
                                                    bookPro
                                                        .morningTimeHour[index]
                                                ? addSlotsMorning.add(
                                                    bookPro
                                                        .afterNoonTime[index],
                                                  )
                                                : SnackBarWidget.show(
                                                    context,
                                                    "Time Expired",
                                                    AppColors.kBlackColor,
                                                  );
                                          }
                                          log(addSlotsMorning.toString());
                                        },
                                        child: NewBox(
                                          color1: addSlotsMorning.contains(
                                                  bookPro.morningTime[index])
                                              ? Colors.green
                                              : bookPro.slotStatus.last <=
                                                      bookPro.morningTimeHour[
                                                          index]
                                                  ? Colors.grey[300]
                                                  : Colors.red,
                                          color2: addSlotsMorning.contains(
                                                  bookPro.morningTime[index])
                                              ? Colors.green
                                              : bookPro.slotStatus.last <=
                                                      bookPro.morningTimeHour[
                                                          index]
                                                  ? Colors.grey[300]
                                                  : Colors.red,
                                          color3: addSlotsMorning.contains(
                                                  bookPro.morningTime[index])
                                              ? Colors.grey.shade200
                                              : Colors.grey.shade200,
                                          child: Container(
                                            height: size.height,
                                            decoration: BoxDecoration(
                                              color: addSlotsMorning.contains(
                                                      bookPro
                                                          .morningTime[index])
                                                  ? Colors.green
                                                  : bookPro.slotStatus.last <=
                                                          bookPro.morningTimeHour[
                                                              index]
                                                      ? Colors.grey[300]
                                                      : Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                bookPro.morningTime[index]
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 8.5,
                                                  fontWeight: FontWeight.w500,
                                                  color: addSlotsMorning
                                                          .contains(bookPro
                                                                  .morningTime[
                                                              index])
                                                      ? Colors.white
                                                      : bookPro.slotStatus
                                                                  .last <=
                                                              bookPro.morningTimeHour[
                                                                  index]
                                                          ? Colors.black
                                                          : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  AppSizedBox.kHeight20,
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.sunny,
                                        color: AppColors.kRedColor,
                                      ),
                                      AppSizedBox.kWidth5,
                                      const Text(
                                        "Afternoon",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.385,
                                      ),
                                      Text(
                                        "Price : ${homePro.homeDatas[selectedIndex].turfPrice!.morningPrice.toString()} Rs",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red.shade700,
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppSizedBox.kHeight20,
                                  GridView.builder(
                                    itemCount: bookPro.afterNoonTime.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1.75,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 20,
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          log(bookPro.afterNoonTime[index]);
                                          if (addSlotsAfternoon.contains(
                                              bookPro.afterNoonTime[index])) {
                                            addSlotsAfternoon.remove(
                                                bookPro.afterNoonTime[index]);
                                          } else {
                                            bookPro.slotStatus.last <=
                                                    bookPro.afterNoonTimeHour[
                                                        index]
                                                ? addSlotsAfternoon.add(bookPro
                                                    .afterNoonTime[index])
                                                : SnackBarWidget.show(
                                                    context,
                                                    "Time Expired",
                                                    AppColors.kBlackColor,
                                                  );
                                          }
                                          log(addSlotsAfternoon.toString());
                                        },
                                        child: NewBox(
                                          color1: addSlotsAfternoon.contains(
                                                  bookPro.afterNoonTime[index])
                                              ? Colors.green
                                              : bookPro.slotStatus.last <=
                                                      bookPro.afterNoonTimeHour[
                                                          index]
                                                  ? Colors.grey[300]
                                                  : Colors.red,
                                          color2: addSlotsAfternoon.contains(
                                                  bookPro.afterNoonTime[index])
                                              ? Colors.green
                                              : bookPro.slotStatus.last <=
                                                      bookPro.afterNoonTimeHour[
                                                          index]
                                                  ? Colors.grey.shade400
                                                  : Colors.red,
                                          color3: addSlotsAfternoon.contains(
                                                  bookPro.afterNoonTime[index])
                                              ? Colors.grey.shade200
                                              : Colors.grey.shade200,
                                          child: Container(
                                            height: size.height,
                                            decoration: BoxDecoration(
                                              color: addSlotsAfternoon.contains(
                                                      bookPro
                                                          .afterNoonTime[index])
                                                  ? Colors.green
                                                  : bookPro.slotStatus.last <=
                                                          bookPro.afterNoonTimeHour[
                                                              index]
                                                      ? Colors.grey.shade300
                                                      : Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                bookPro.afterNoonTime[index]
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 8.5,
                                                  fontWeight: FontWeight.w500,
                                                  color: addSlotsAfternoon
                                                          .contains(bookPro
                                                                  .afterNoonTime[
                                                              index])
                                                      ? Colors.white
                                                      : bookPro.slotStatus
                                                                  .last <=
                                                              bookPro.afterNoonTimeHour[
                                                                  index]
                                                          ? Colors.black
                                                          : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                  AppSizedBox.kHeight20,
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.bedtime,
                                        color: Colors.grey.shade700,
                                      ),
                                      AppSizedBox.kWidth5,
                                      const Text(
                                        "Evening",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: size.width * 0.41,
                                      ),
                                      Text(
                                        "Price : ${homePro.homeDatas[selectedIndex].turfPrice!.morningPrice.toString()} Rs",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey.shade800,
                                        ),
                                      ),
                                    ],
                                  ),
                                  AppSizedBox.kHeight20,
                                  GridView.builder(
                                    itemCount: bookPro.eveningTime.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 1.75,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 20,
                                      crossAxisCount: 3,
                                    ),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return GestureDetector(
                                        onTap: () {
                                          bookPro.slotStatus.clear();
                                          bookPro
                                              .slotCalculationTime(railWayTime);
                                          log(bookPro.slotStatus.toString());
                                          log(bookPro.eveningTimeHour[index]
                                              .toString());
                                          log(bookPro.eveningTime[index]);
                                          if (addSlotsEvening.contains(
                                              bookPro.eveningTime[index])) {
                                            addSlotsEvening.remove(
                                                bookPro.eveningTime[index]);
                                          } else {
                                            bookPro.slotStatus.last <=
                                                    bookPro
                                                        .eveningTimeHour[index]
                                                ? addSlotsEvening.add(
                                                    bookPro.eveningTime[index])
                                                : SnackBarWidget.show(
                                                    context,
                                                    "Time Expired",
                                                    AppColors.kBlackColor,
                                                  );
                                          }
                                          log(addSlotsEvening.toString());
                                        },
                                        child: NewBox(
                                          color1: addSlotsEvening.contains(
                                                  bookPro.eveningTime[index])
                                              ? Colors.green
                                              : bookPro.slotStatus.last <=
                                                      bookPro.eveningTimeHour[
                                                          index]
                                                  ? Colors.grey[300]
                                                  : Colors.red,
                                          color2: addSlotsEvening.contains(
                                                  bookPro.eveningTime[index])
                                              ? Colors.green
                                              : bookPro.slotStatus.last <=
                                                      bookPro.eveningTimeHour[
                                                          index]
                                                  ? Colors.grey.shade400
                                                  : Colors.red,
                                          color3: addSlotsEvening.contains(
                                                  bookPro.eveningTime[index])
                                              ? Colors.grey.shade200
                                              : Colors.grey.shade200,
                                          child: Container(
                                            height: size.height,
                                            decoration: BoxDecoration(
                                              color: addSlotsEvening.contains(
                                                bookPro.eveningTime[index],
                                              )
                                                  ? Colors.green
                                                  : bookPro.slotStatus.last <=
                                                          bookPro.eveningTimeHour[
                                                              index]
                                                      ? Colors.grey.shade300
                                                      : Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                bookPro.eveningTime[index]
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 8.5,
                                                  fontWeight: FontWeight.w500,
                                                  color: addSlotsEvening
                                                          .contains(bookPro
                                                                  .eveningTime[
                                                              index])
                                                      ? Colors.white
                                                      : bookPro.slotStatus
                                                                  .last <=
                                                              bookPro.eveningTimeHour[
                                                                  index]
                                                          ? Colors.black
                                                          : Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 60,
                      child: NewBox(
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                            color: AppColors.kRedColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
