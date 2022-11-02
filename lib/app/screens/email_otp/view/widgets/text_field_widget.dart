import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:turfxbooking/app/screens/widgets/new_box/new_box.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.onChanged,
    required this.controller,
  });

  final void Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: NewBox(
        child: SizedBox(
          height: 60,
          width: 64,
          child: NewBox(
            child: TextFormField(
              onChanged: onChanged,
              controller: controller,
              onSaved: (value) {},
              decoration: const InputDecoration(
                hintText: "0",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.left,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
