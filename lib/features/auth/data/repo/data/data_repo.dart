import '../../models/user_data_model.dart';

abstract class DataRepo {
  Future<void> addUserData(UserDataModel userData);
  Future<List<Map>> getUserData();
  Future<bool> isUserDataExist();
  Future<void> updateUserData(String userImage);
}
