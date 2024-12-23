import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter_app/features/auth/data/models/user_data_model.dart';
import 'package:supabase_flutter_app/features/auth/data/repo/data/data_repo.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit(this._dataRepo) : super(UserDataInitial());
  final DataRepo _dataRepo;

  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final user = await _dataRepo.getUserData();
      final userData = UserDataModel.fromjson(user.first);

      emit(GetUserDataSuccess(userData: userData));
    } catch (e) {
      emit(UserDataFailure(errorMessage: e.toString()));
      log('error from get user data: $e');
    }
  }

  @override
  void onChange(Change<UserDataState> change) {
    log("change: $change");
    super.onChange(change);
  }
}
