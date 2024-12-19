import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter_app/core/utils/shared_pref_service.dart';

import '../../../data/repo/auth_repo.dart';
import 'auth_events.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final AuthRepo _authRepo;
  final SharedPrefService _prefService;
  AuthBloc(this._authRepo, this._prefService) : super(AuthInitial()) {
    on<AuthEvents>((event, emit) async {
      if (event is RegisterEvent) {
        emit(AuthLoading());
        try {
          final response =
              await _authRepo.register(event.email, event.password);
          if (response.user != null) {
            log("uid: ${Supabase.instance.client.auth.currentUser!.id}");
            await _prefService.setString();
            emit(RegisterSuccess());
          }
        } on AuthException catch (e) {
          if (e.code == "user_already_exists") {
            emit(AuthFailure(errorMessage: "user_already_exists"));
          }
        } catch (e) {
          emit(AuthFailure(errorMessage: e.toString()));
          log("error from register auth: $e");
        }
      }

      if (event is LoginEvent) {
        emit(AuthLoading());
        try {
          final response = await _authRepo.login(event.email, event.password);
          if (response.user != null) {
            log("uid: ${Supabase.instance.client.auth.currentUser!.id}");
            await _prefService.setString();
            emit(LoginSuccess());
          }
        } on AuthException catch (e) {
          if (e.code == "invalid_credentials") {
            emit(AuthFailure(errorMessage: "invalid_credentials"));
          }
        } catch (e) {
          emit(AuthFailure(errorMessage: e.toString()));
          log("error from login auth: $e");
        }
      }
      if (event is LogoutEvent) {
        await _authRepo.logout();
        await _prefService.clearShared();
        emit(LogoutSuccess());
      }

      if (event is ResetPasswordEvent) {
        await _authRepo
            .resetPassword(Supabase.instance.client.auth.currentUser!.email!);
        emit(ResetPasswordSuccess());
      }

      if (event is GoogleEvent) {
        emit(GoogleLoading());
        try {
          final response = await _authRepo.signInWithGoogle();
          if (response!.user != null) {
            await _prefService.setString();
            emit(GoogleSuccess());
          }
        } catch (e) {
          emit(AuthFailure(errorMessage: e.toString()));
          log("error from googel auth: $e");
        }
      }
    });
  }

  @override
  void onChange(Change<AuthStates> change) {
    log("change: $change");
    super.onChange(change);
  }
}
