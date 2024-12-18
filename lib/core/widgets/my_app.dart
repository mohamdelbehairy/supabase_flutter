import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/register_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const RegisterView(),
    );
  }
}
