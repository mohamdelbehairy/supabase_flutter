import 'package:flutter/material.dart';
import 'package:supabase_flutter_app/core/utils/shared_pref_service.dart';

import 'core/utils/init_supabase.dart';
import 'core/widgets/my_app.dart';
import 'features/auth/presentation/views/register_view.dart';
import 'features/home/presentation/views/home_view.dart';

void main() async {
  await initSupabase();
  _init();
}

_init() async {
  final SharedPrefService sharedPrefService = SharedPrefService();
  final userID = await sharedPrefService.getString();
  userID.isNotEmpty
      ? runApp(const MyApp(view: HomeView()))
      : runApp(const MyApp(view: RegisterView()));
}
