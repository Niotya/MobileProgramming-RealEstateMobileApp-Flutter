import 'package:shared_preferences/shared_preferences.dart';

class StorageUtils {
  static const String onboardingKey = 'isOnboardingCompleted';

  // Fungsi untuk menyimpan status onboarding selesai
  static Future<void> setOnboardingCompleted(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(onboardingKey, value);
  }

  // Fungsi untuk memeriksa status onboarding selesai atau belum
  static Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onboardingKey) ?? false;
  }
}
