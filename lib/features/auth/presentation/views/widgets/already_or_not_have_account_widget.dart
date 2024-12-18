import 'package:flutter/material.dart';

class AlreadyOrNotHaveAccountWidget extends StatelessWidget {
  const AlreadyOrNotHaveAccountWidget(
      {super.key, this.text, this.buttonName, required this.onPressed});
  final String? text;
  final String? buttonName;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text ?? "Already have an account?"),
        TextButton(onPressed: onPressed, child: Text(buttonName ?? "Login"))
      ],
    );
  }
}