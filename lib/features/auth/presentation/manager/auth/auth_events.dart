final class AuthEvents {}

final class RegisterEvent extends AuthEvents {
  final String email, password;
  RegisterEvent({required this.email, required this.password});
}

final class LoginEvent extends AuthEvents {
  final String email, password;
  LoginEvent({required this.email, required this.password});
}

final class LogoutEvent extends AuthEvents {}

final class ResetPasswordEvent extends AuthEvents {}

final class GoogleEvent extends AuthEvents {}
