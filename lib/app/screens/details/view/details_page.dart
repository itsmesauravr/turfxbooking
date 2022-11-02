import 'package:flutter/material.dart';
import 'package:turfxbooking/app/screens/details/widgets/bottom_box.dart';
import 'package:turfxbooking/app/screens/details/widgets/top_box.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.selectedIndex});

  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBackGroundColor,
        body: Column(
          children: [
            TopBoxWidget(selectedIndex: selectedIndex),
            BottomBoxWidget(selectedIndex: selectedIndex),
          ],
        ),
      ),
    );
  }
}
