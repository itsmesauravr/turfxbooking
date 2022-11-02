import 'package:flutter/material.dart';

class TextDetailsWidgets extends StatelessWidget {
  const TextDetailsWidgets({
    super.key,
    required this.selectedIndex,
    required this.text,
    required this.text2,
  });

  final int selectedIndex;
  final String text;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            color: text2 == " Available" ? Colors.green : Colors.red,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
