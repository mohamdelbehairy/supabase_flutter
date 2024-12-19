import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_events.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_state.dart';
import 'package:supabase_flutter_app/features/home/presentation/views/home_view.dart';

import '../login_view.dart';
import 'already_or_not_have_account_widget.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';
import 'login_using_google_widget.dart';

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
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomeView()));
        }
        if (state is AuthFailure &&
            state.errorMessage == "user_already_exists") {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("User already registered")));
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
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const LoginView()))),
                const SizedBox(height: 12),
                CustomButton(onPressed: () {
                  if (globalKey.currentState!.validate()) {
                    globalKey.currentState!.save();
                    context.read<AuthBloc>().add(RegisterEvent(
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
