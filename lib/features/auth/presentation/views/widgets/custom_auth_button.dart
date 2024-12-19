import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton(
      {super.key, this.isLoading = false, this.name, required this.onTap});
  final bool isLoading;
  final String? name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(32)),
        child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(color: Colors.white))
                : Text("Sign in with ${name ?? "Google"}",
                    style: const TextStyle(color: Colors.white))),
      ),
    );
  }
}
