final class AuthStates {}

final class AuthInitial extends AuthStates {}

final class AuthLoading extends AuthStates {}

final class RegisterSuccess extends AuthStates {}

final class LoginSuccess extends AuthStates {}

final class LogoutSuccess extends AuthStates {}


final class AuthFailure extends AuthStates {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}
