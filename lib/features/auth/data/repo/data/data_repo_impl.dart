import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter_app/features/auth/data/repo/data/data_repo.dart';

import '../../models/user_data_model.dart';

class DataRepoImpl extends DataRepo {
  @override
  Future<void> addUserData(UserDataModel userData) async {
    try {
      await Supabase.instance.client.from("user").insert(userData.toJson());
      log("user data added successfully");
    } catch (e) {
      log("error from add user data: $e");
    }
  }
}
