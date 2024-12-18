import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_bloc.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_events.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/auth/auth_state.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../auth/presentation/views/register_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Home",
          automaticallyImplyLeading: false,
          actions: [
            BlocListener<AuthBloc, AuthStates>(
              listener: (context, state) {
                if (state is LogoutSuccess) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const RegisterView()));
                }
              },
              child: IconButton(
                  onPressed: () async {
                    context.read<AuthBloc>().add(LogoutEvent());
                  },
                  icon: const Icon(Icons.logout)),
            )
          ]),
    );
  }
}
