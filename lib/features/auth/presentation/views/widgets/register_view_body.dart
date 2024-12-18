import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'already_or_not_have_account_widget.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  late TextEditingController email, password;

  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  void initState() {
    email = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Form(
        key: globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: email,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your email";
                }
                if (!EmailValidator.validate(value)) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            CustomTextField(
              hintText: 'password',
              controller: password,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your password";
                }
                if (value.length < 6) {
                  return "Password must be at least 6 characters";
                }
                return null;
              },
            ),
            AlreadyOrNotHaveAccountWidget(onPressed: () {}),
            const SizedBox(height: 12),
            CustomButton(onPressed: () {
              if (globalKey.currentState!.validate()) {
                globalKey.currentState!.save();
              }
            })
          ],
        ),
      ),
    );
  }
}
