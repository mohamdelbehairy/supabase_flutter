import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/presentation/manager/auth/auth_bloc.dart';
import '../../features/auth/presentation/views/register_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(AuthRepoImpl()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: const RegisterView(),
      ),
    );
  }
}
