import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_events.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_state.dart';

import '../../../../home/presentation/views/home_view.dart';
import '../../manager/auth/auth_bloc.dart';
import 'already_or_not_have_account_widget.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'login_using_google_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
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
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomeView()));
        }

        if (state is AuthFailure &&
            state.errorMessage == "invalid_credentials") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Check your email and password and try again")));
        }
      },
      builder: (context, state) {
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
                  obscureText: true,
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
                AlreadyOrNotHaveAccountWidget(
                    text: "Don't have an account?",
                    buttonName: "Register",
                    onPressed: () => Navigator.of(context).pop()),
                const SizedBox(height: 12),
                CustomButton(
                    name: "Login",
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        globalKey.currentState!.save();
                        context.read<AuthBloc>().add(LoginEvent(
                            email: email.text, password: password.text));
                      }
                    }),
                const SizedBox(height: 32),
                const LoginUsingGoogleWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}
