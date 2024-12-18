import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SharedPrefService {
  SharedPreferences? _prefs;

  Future<SharedPreferences> getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<void> setString() async {
    final prefs = await getPrefs();
    await prefs.setString(
        "userID", Supabase.instance.client.auth.currentUser!.id);
  }

  Future<String> getString() async {
    final prefs = await getPrefs();
    return prefs.getString('userID') ?? '';
  }

  Future<void> clearShared() async {
    final prefs = await getPrefs();
    await prefs.clear();
  }
}
