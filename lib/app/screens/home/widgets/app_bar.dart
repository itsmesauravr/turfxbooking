import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turfxbooking/app/screens/home/services/location_services.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/sized_box/sized_box.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<LocationServices>(context, listen: false)
        .getCurrentPosition(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: size.height * .19,
        width: size.width,
        child: NewBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AppSizedBox.kWidth10,
                  Icon(
                    Icons.location_on,
                    size: 20,
                    color: AppColors.kRedColor,
                  ),
                  AppSizedBox.kWidth5,
                  Consumer<LocationServices>(
                    builder: (context, value, _) {
                      return Text(
                        value.currentDistrict.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      );
                    },
                  ),
                ],
              ),
              AppSizedBox.kHeight10,
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                child: NewBox(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
