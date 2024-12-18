import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<AuthResponse> register(String email, String password);
  Future<AuthResponse> login(String email, String password);
}
