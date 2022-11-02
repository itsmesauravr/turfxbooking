import 'package:flutter/material.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.height,
    required this.width,
    required this.top,
    required this.left,
    required this.image,
  });

  final double? height;
  final double? width;
  final double? top;
  final double? left;
  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: NewBox(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: image,
            ),
          ),
        ),
      ),
    );
  }
}
