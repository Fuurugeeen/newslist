import 'package:shared_preferences/shared_preferences.dart';

import '../model/model.dart';

// 初回はエラー。app.dart内で上書き
final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());

class DeviceSetting {
  DeviceSetting();

  static Future<String> getSetting(String key, String def) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key) ?? def;
    return value.toString();
  }

  static Future<void> setSetting(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
