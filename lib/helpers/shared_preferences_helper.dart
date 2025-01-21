import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _isFirstTimeKey = 'isFirstTime';

  // التحقق إذا كانت أول مرة
  static Future<bool> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isFirstTime = prefs.getBool(_isFirstTimeKey);
    if (isFirstTime == null || isFirstTime) {
      await prefs.setBool(_isFirstTimeKey, false); // تخزين الحالة
      return true;
    }
    return false;
  }
}
