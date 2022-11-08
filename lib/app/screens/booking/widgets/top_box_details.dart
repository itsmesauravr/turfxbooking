import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class TopBoxDetailsWidget extends StatelessWidget {
  const TopBoxDetailsWidget({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeViewModel>(context);
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.red,
          backgroundImage:
              NetworkImage(homePro.homeDatas[selectedIndex].turfLogo!),
        ),
        AppSizedBox.kHeight10,
        Text(
          homePro.homeDatas[selectedIndex].turfName!,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        AppSizedBox.kHeight20,
        NewBox(
          child: HorizontalCalendar(
            date: DateTime.now(),
            textColor: Colors.grey.shade600,
            initialDate: DateTime.now().subtract(const Duration(days: 3)),
            backgroundColor: AppColors.kBackGroundColor,
            selectedColor: AppColors.kRedColor,
            onDateSelected: (date) {
              log(
                date.toString(),
              );
            },
          ),
        )
      ],
    );
  }
}
