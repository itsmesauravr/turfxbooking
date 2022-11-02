import 'package:flutter/material.dart';

class TurfImageContainer extends StatelessWidget {
  const TurfImageContainer({super.key, required this.turfImage});

  final String turfImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(turfImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
