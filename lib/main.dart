import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter_app/core/utils/secret_key.dart';

import 'core/widgets/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: SecretKey.url, anonKey: SecretKey.anonKey);
  runApp(const MyApp());
}


