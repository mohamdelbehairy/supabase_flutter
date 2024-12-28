import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/core/utils/shared_pref_service.dart';
import 'package:supabase_flutter_app/features/auth/data/repo/data/data_repo_impl.dart';
import 'package:supabase_flutter_app/features/auth/presentation/manager/user_data/user_data_cubit.dart';

import '../../features/auth/data/repo/auth/auth_repo_impl.dart';
import '../../features/auth/presentation/manager/auth/auth_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.view});
  final Widget view;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(AuthRepoImpl(), SharedPrefService(), DataRepoImpl()),
        ),
        BlocProvider(
          create: (context) => UserDataCubit(DataRepoImpl())..getUserData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: view,
      ),
    );
  }
}
