part of 'user_data_cubit.dart';

sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class GetUserDataLoading extends UserDataState {}

final class GetUserDataSuccess extends UserDataState {
  final UserDataModel userData;

  GetUserDataSuccess({required this.userData});
}

final class UserDataFailure extends UserDataState {
  final String errorMessage;

  UserDataFailure({required this.errorMessage});
}
