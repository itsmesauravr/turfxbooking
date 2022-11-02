import 'package:flutter/material.dart';
import 'package:turfxbooking/app/screens/signup/view/widgets/sign_up_container_box.dart';
import 'package:turfxbooking/app/screens/widgets/container/container.dart';
import 'package:turfxbooking/app/utils/colors/colors.dart';
import 'package:turfxbooking/app/utils/images/images.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.kBackGroundColor,
        body: Stack(
          children: [
            ContainerWidget(
              top: 20,
              left: 30,
              height: size.height * 2.5 / 10,
              width: size.width * 8 / 10,
              image: const AssetImage(
                AppImages.kHolderImage,
              ),
            ),
            ContainerWidget(
              top: 27,
              left: 38,
              height: size.height * 2.3 / 10,
              width: size.width * 7.6 / 10,
              image: const AssetImage(
                AppImages.kHolderImage,
              ),
            ),
            const SignUpContainerBox(),
          ],
        ),
      ),
    );
  }
}
