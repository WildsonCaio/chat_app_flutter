import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  bool isObscure;
  String labelText;

  CustomInput({super.key, this.isObscure = false, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TextField(
        obscureText: isObscure,
        decoration: InputDecoration(
            border: const OutlineInputBorder(), hintText: labelText),
      ),
    );
  }
}
