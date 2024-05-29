import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Initialize the cache
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static String? getDataString({required String key}) {
    return sharedPreferences.getString(key) ?? "";
  }

  //! Save data in local database using key
  static Future<bool> saveData(
      {required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //! Get data already saved in local database
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! Remove data using specific key
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! Check if local database contains key
  static Future<bool> containsKey({required String key}) async {
    return sharedPreferences.containsKey(key);
  }

  //! Clear all data
  static Future<bool> clearData() async {
    return sharedPreferences.clear();
  }

  //! Save data in local database using key
  static Future<dynamic> put({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }
}
