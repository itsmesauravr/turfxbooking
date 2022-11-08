import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';

class BookingViewModel extends ChangeNotifier {
  totalSlot(selectedIndex, context, time) {
    numberSlotsOnMorning(selectedIndex, context);
    numberSlotsOnAfterNoon(selectedIndex, context);
    numberSlotsOnEvening(selectedIndex, context);
    slotCalculationTime(time);
  }

  //============================== Morning Slot ================================

  List<dynamic> morningTime = [];
  List<dynamic> morningTimeHour = [];
  numberSlotsOnMorning(int selectedIndex, context) {
    final homePro = Provider.of<HomeViewModel>(context, listen: false);
    for (dynamic i =
            homePro.homeDatas[selectedIndex].turfTime!.timeMorningStart!;
        i <= homePro.homeDatas[selectedIndex].turfTime!.timeMorningEnd!;
        i++) {
      if (i + 1 < 12) {
        morningTime.add("$i : 00 AM - ${i + 1} : 00 AM");
        morningTimeHour.add(i);
        log(i.toString());
        log(morningTime.toString());
        notifyListeners();
      }
      if (i + 1 == 12) {
        morningTime.add("$i : 00 AM - ${i + 1} : 00 PM");
        morningTimeHour.add(i);
        log(i.toString());
        log(morningTime.toString());
        notifyListeners();
      }
    }
  }

  //============================= Afternoon Slot ===============================

  List<dynamic> afterNoonTime = [];
  List<dynamic> afterNoonTimeHour = [];
  numberSlotsOnAfterNoon(int selectedIndex, context) {
    final homePro = Provider.of<HomeViewModel>(context, listen: false);
    for (dynamic i =
            homePro.homeDatas[selectedIndex].turfTime!.timeAfternoonStart!;
        i <= homePro.homeDatas[selectedIndex].turfTime!.timeAfternoonEnd!;
        i++) {
      if (i >= 12) {
        afterNoonTime.add("${i - 12}: 00 PM - ${i - 12 + 1} : 00 PM");
        afterNoonTimeHour.add(i);
        log(afterNoonTime.toString());
        log(afterNoonTime.length.toString());
        notifyListeners();
      }
    }
  }

  //============================== Evening Slot ================================

  List<dynamic> eveningTime = [];
  List<dynamic> eveningTimeHour = [];
  numberSlotsOnEvening(int selectedIndex, context) {
    final homePro = Provider.of<HomeViewModel>(context, listen: false);
    for (dynamic i =
            homePro.homeDatas[selectedIndex].turfTime!.timeEveningStart!;
        i <= homePro.homeDatas[selectedIndex].turfTime!.timeEveningEnd!;
        i++) {
      if (i >= 12 && i < 22) {
        eveningTime.add("${i + 1 - 12}: 00 PM - ${i - 12 + 2} : 00 PM");
        eveningTimeHour.add(i);
        log(eveningTime.toString());
        log(eveningTime.length.toString());
        notifyListeners();
      }
      if (i == 23) {
        eveningTime.add("${i - 12}: 00 PM - ${i - 12 + 1}: 00 AM");
        eveningTimeHour.add(i);
        log(eveningTime.toString());
        log(eveningTime.length.toString());
        notifyListeners();
      }
      if (i > 23) {
        eveningTime.add("${i - 12}: 00 AM - ${i - 24 + 1} : 00 AM");
        eveningTimeHour.add(i);
        log(eveningTime.toString());
        log(eveningTime.length.toString());
        notifyListeners();
      }
    }
  }

  //============================== Slot Calculation ================================

  List<dynamic> slotStatus = [];
  slotCalculationTime(time) {
    for (dynamic i = 1; i <= time; i++) {
      slotStatus.add(i);
      notifyListeners();
    }
  }

  //============================== Date Calculation ================================
  List<dynamic> date = [];
  dateCalculation(date) {
    for (dynamic i = 1; i <= 31; i++) {
      date.add(i);
      notifyListeners();
    }
    return date;
  }

  disposes() {
    afterNoonTime.clear();
    eveningTime.clear();
    morningTime.clear();
  }
}
