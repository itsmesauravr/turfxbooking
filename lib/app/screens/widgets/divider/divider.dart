import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        SizedBox(
          height: 10,
          width: 100,
          child: Divider(
            thickness: 2,
          ),
        ),
        Text(
          "or",
          style: TextStyle(color: Colors.black),
        ),
        SizedBox(
          height: 10,
          width: 100,
          child: Divider(
            thickness: 2,
          ),
        )
      ],
    );
  }
}
