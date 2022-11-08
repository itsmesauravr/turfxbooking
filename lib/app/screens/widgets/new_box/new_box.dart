import 'package:flutter/material.dart';

class NewBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final child;
  const NewBox({
    Key? key,
    this.child,
    this.color1,
    this.color2,
    this.color3,
  }) : super(key: key);

  final Color? color1;
  final Color? color2;
  final Color? color3;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color1 ?? Colors.grey[300],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          // darker shadow on the bottom right
          BoxShadow(
            color: color2 ?? Colors.grey.shade500,
            blurRadius: 15,
            offset: const Offset(5, 5),
          ),

          //lighter shadow on the top left
          BoxShadow(
            color: color3 ?? Colors.white,
            blurRadius: 15,
            offset: const Offset(-5, -5),
          ),
        ],
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
