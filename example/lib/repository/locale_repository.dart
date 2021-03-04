import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleRepository {
  static const STORE_LOCALE = 'locale';

  static LocaleRepository? _instance;

  LocaleRepository._();

  factory LocaleRepository() => _instance ??= LocaleRepository._();

  Future<void> setCustomLocale(Locale? locale) async {
    final prefs = await SharedPreferences.getInstance();
    if (locale == null) {
      await prefs.remove(STORE_LOCALE);
      return;
    }
    await prefs.setString(STORE_LOCALE, locale.languageCode);
  }

  Future<Locale?> getCustomLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(STORE_LOCALE);
    if (localeCode == null || localeCode.isEmpty) return null;
    return Locale(localeCode);
  }
}
