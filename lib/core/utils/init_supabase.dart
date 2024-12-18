import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'secret_key.dart';

Future<void> initSupabase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: SecretKey.url, anonKey: SecretKey.anonKey);
}
