import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter_app/core/utils/secret_key.dart';

import 'auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final SupabaseClient _client = Supabase.instance.client;

  @override
  Future<AuthResponse> register(String email, String password) async {
    return await _client.auth.signUp(email: email, password: password);
  }

  @override
  Future<AuthResponse> login(String email, String password) async {
    return await _client.auth
        .signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    if (Supabase.instance.client.auth.currentUser!.appMetadata['provider'] ==
        "google") {
      await GoogleSignIn().signOut();
    } else {
      await _client.auth.signOut();
    }
  }

  @override
  Future<void> resetPassword(String email) async {
    await _client.auth.resetPasswordForEmail(email);
  }

  @override
  Future<AuthResponse?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: SecretKey.iosClientID, serverClientId: SecretKey.webClientID);

    GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;

      if (googleAuth.accessToken != null) {
        return await _client.auth.signInWithIdToken(
            provider: OAuthProvider.google,
            idToken: googleAuth.idToken!,
            accessToken: googleAuth.accessToken!);
      }
    }
    return null;
  }

  @override
  Future<void> signInWithFacebook() async {
    await _client.auth.signInWithOAuth(OAuthProvider.facebook,
        redirectTo:
            "https://tgrqdzakirkpkdcfkpux.supabase.co/auth/v1/callback");
  }
}
