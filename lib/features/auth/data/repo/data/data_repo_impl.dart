import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_flutter_app/features/auth/data/repo/data/data_repo.dart';

import '../../models/user_data_model.dart';

class DataRepoImpl extends DataRepo {
  final SupabaseClient _client = Supabase.instance.client;
  @override
  Future<void> addUserData(UserDataModel userData) async {
    try {
      await _client.from("user").insert(userData.toJson());
      log("user data added successfully");
    } catch (e) {
      log("error from add user data: $e");
    }
  }

  @override
  Future<List<Map>> getUserData() async {
    return await _client
        .from("user")
        .select()
        .eq("userID", _client.auth.currentUser!.id);
  }

  @override
  Future<bool> isUserDataExist() async {
    final userData = await getUserData();
    return userData.isNotEmpty;
  }

  @override
  Future<void> updateUserData() async {
    await _client.from("user").update({"userName": "Mohamed Elbehairy"}).eq(
        "userID", _client.auth.currentUser!.id);
  }
}
