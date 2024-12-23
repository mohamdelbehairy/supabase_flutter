import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/data/repo/data/data_repo_impl.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/user_data/user_data_cubit.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/custom_logout_button.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserDataCubit(DataRepoImpl())..getUserData(),
      child: Scaffold(
        appBar: customAppBar(
            title: "Home",
            automaticallyImplyLeading: false,
            actions: [const CustomLogoutButton()]),
        body: const HomeViewBody(),
      ),
    );
  }
}

