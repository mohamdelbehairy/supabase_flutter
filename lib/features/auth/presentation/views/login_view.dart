import 'package:flutter/material.dart';
import 'package:supabase_flutter/core/widgets/custom_app_bar.dart';
import 'package:supabase_flutter/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Login'),
      body: const LoginViewBody(),
    );
  }
}