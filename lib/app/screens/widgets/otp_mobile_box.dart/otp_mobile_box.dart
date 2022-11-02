import 'package:flutter/material.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';

class MobileOtpWidget extends StatelessWidget {
  const MobileOtpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .75 / 10,
      width: size.width * 7 / 10,
      child: NewBox(
        child: TextButton.icon(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
          ),
          icon: const Icon(
            Icons.mobile_friendly,
            color: Colors.red,
          ),
          label: const Text(
            "OTP Mobile Number",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
