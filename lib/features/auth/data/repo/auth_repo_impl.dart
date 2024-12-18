import 'package:supabase_flutter/supabase_flutter.dart';

import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final SupabaseClient _client = Supabase.instance.client;

  @override
  Future<AuthResponse> register(String email, String password) async {
    final reponse = await _client.auth.signUp(email: email, password: password);
    return reponse;
  }

  @override
  Future<AuthResponse> login(String email, String password) async {
    final reponse =
        await _client.auth.signInWithPassword(email: email, password: password);
    return reponse;
  }

  @override
  Future<void> logout() async {
    await _client.auth.signOut();
  }
}
