import 'package:flutter/material.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';

class TextFormFieldWiget extends StatelessWidget {
  const TextFormFieldWiget({
    super.key,
    required this.controller,
    required this.validator,
    required this.labelText,
    required this.keyboardType,
    required this.obscureText,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NewBox(
        child: TextFormField(
          validator: validator,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: labelText,
            suffixIcon: suffixIcon,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
