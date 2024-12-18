import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/presentation/manager/auth/auth_bloc.dart';
import '../../../../auth/presentation/manager/auth/auth_events.dart';
import '../../../../auth/presentation/manager/auth/auth_state.dart';
import '../../../../auth/presentation/views/register_view.dart';

class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthStates>(
      listener: (context, state) {
        if (state is LogoutSuccess) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const RegisterView()));
        }
      },
      child: IconButton(
          onPressed: () async {
            context.read<AuthBloc>().add(LogoutEvent());
          },
          icon: const Icon(Icons.logout)),
    );
  }
}
