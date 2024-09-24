import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {

  String labelText;
  ConfirmButton({super.key, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 40,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(labelText),
      ),
    );
  }
}
