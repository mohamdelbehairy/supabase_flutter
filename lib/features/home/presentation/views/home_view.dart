import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_events.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_state.dart';
import 'package:supabase_flutter_app/features/auth/presentation/views/widgets/custom_button.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/custom_logout_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Home",
          automaticallyImplyLeading: false,
          actions: [const CustomLogoutButton()]),
      body: BlocListener<AuthBloc, AuthStates>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Check your email to reset password")));
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    name: "Reset Password",
                    onPressed: () {
                      context.read<AuthBloc>().add(ResetPasswordEvent());
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
