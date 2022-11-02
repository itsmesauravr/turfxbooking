import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/home/view_model/home_view_model.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class BookingScreenWidget extends StatelessWidget {
  const BookingScreenWidget({
    super.key,
    required this.selectedIndex,
  });
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final homePro = Provider.of<HomeViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.379,
                width: size.width,
                child: NewBox(
                  child: NewBox(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.red,
                          backgroundImage: NetworkImage(
                              homePro.homeDatas[selectedIndex].turfLogo!),
                        ),
                        AppSizedBox.kHeight10,
                        Text(
                          homePro.homeDatas[selectedIndex].turfName!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        AppSizedBox.kHeight20,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.calendar_month,
                                size: 30,
                                color: AppColors.kRedColor,
                              ),
                            ),
                            AppSizedBox.kWidth5,
                            const Text(
                              "Select Date",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppSizedBox.kHeight10,
              const Expanded(
                child: NewBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
