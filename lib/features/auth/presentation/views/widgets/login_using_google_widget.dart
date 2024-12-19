import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_state.dart';

import '../../../../home/presentation/views/home_view.dart';
import '../../manager/auth/auth_events.dart';

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
        return GestureDetector(
          onTap: () => context.read<AuthBloc>().add(GoogleEvent()),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(32)),
            child: Center(
                child: state is GoogleLoading
                    ? const SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(color: Colors.white),
                      )
                    : const Text("Sign in with Google",
                        style: TextStyle(color: Colors.white))),
          ),
        );
      },
    );
  }
}
