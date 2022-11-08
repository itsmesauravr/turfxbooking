import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/booking/view_model/booking_view_model.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';

class BookingSlotContainer extends StatelessWidget {
  BookingSlotContainer({super.key, required this.selectedIndex});

  final int selectedIndex;
  final time = DateFormat.j().format(DateTime.now());

  void timeSe() {
    log(time.toString());
  }

  @override
  Widget build(BuildContext context) {
    final homePro = Provider.of<HomeViewModel>(context);
    final bookPro = Provider.of<BookingViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5),
      height: size.height * 0.5,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          time.toString(),
        ),
      ),
    );
  }
}
