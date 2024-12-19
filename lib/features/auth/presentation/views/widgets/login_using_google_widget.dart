import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_state.dart';

import '../../../../home/presentation/views/home_view.dart';
import '../../manager/auth/auth_events.dart';
import 'custom_auth_button.dart';

class LoginUsingGoogleWidget extends StatelessWidget {
  const LoginUsingGoogleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is GoogleSuccess) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomeView()));
        }
      },
      builder: (context, state) {
        return CustomAuthButton(
          isLoading: state is GoogleLoading,
          onTap: () => context.read<AuthBloc>().add(GoogleEvent()),
        );
      },
    );
  }
}
