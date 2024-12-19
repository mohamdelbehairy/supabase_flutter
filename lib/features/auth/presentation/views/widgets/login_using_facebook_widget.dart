import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_events.dart';

import '../../manager/auth/auth_bloc.dart';
import 'custom_auth_button.dart';

class LoginUsingFacebookWidget extends StatelessWidget {
  const LoginUsingFacebookWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAuthButton(name: "Facebook", onTap: () {
      context.read<AuthBloc>().add(FacebookEvent());
    });
  }
}
