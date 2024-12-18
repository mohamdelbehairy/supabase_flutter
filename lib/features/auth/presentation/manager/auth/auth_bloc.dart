import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/repo/auth_repo.dart';
import 'auth_events.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<AuthEvents>((event, emit) async {
      if (event is RegisterEvent) {
        emit(AuthLoading());
        try {
          final response =
              await _authRepo.register(event.email, event.password);
          if (response.user != null) {
            log("uid: ${Supabase.instance.client.auth.currentUser!.id}");
            emit(RegisterSuccess());
          }
        } on AuthException catch (e) {
          if (e.code == "user_already_exists") {
            emit(AuthFailure(errorMessage: "user_already_exists"));
          }
          log("error from register auth: $e");
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
            emit(LoginSuccess());
          }
        } catch (e) {
          emit(AuthFailure(errorMessage: e.toString()));
          log("error from login auth: $e");
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
