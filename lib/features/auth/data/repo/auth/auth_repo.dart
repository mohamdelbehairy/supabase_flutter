import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepo {
  Future<AuthResponse> register(String email, String password);
  Future<AuthResponse> login(String email, String password);
  Future<void> logout();
  Future<void> resetPassword(String email);
  Future<AuthResponse?> signInWithGoogle();
  Future<void> signInWithFacebook();
}
