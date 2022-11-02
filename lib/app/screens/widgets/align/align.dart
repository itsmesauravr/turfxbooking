import 'package:flutter/material.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';

class AlignMentWidget extends StatelessWidget {
  const AlignMentWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        height: height,
        width: width,
        child: const NewBox(),
      ),
    );
  }
}
