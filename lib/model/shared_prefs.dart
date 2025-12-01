import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static const String _keyLoggedIn = 'isUserLoggedIn';
  static const String _keyUsername = 'username';

  // --- SETTERS ---
  static Future<void> saveUser({required bool isLoggedIn, required String username}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLoggedIn, isLoggedIn);
    await prefs.setString(_keyUsername, username);
    print("saved");
  }

  // --- GETTERS ---
  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // Returns false if key doesn't exist (first run)
    return prefs.getBool(_keyLoggedIn) ?? false;
  }

  static Future<String> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyUsername) ?? '';
  }

  // Optional: clear data
  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLoggedIn);
    await prefs.remove(_keyUsername);
  }
}