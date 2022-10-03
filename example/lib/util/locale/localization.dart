import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:icapps_translations_example/util/locale/localization_keys.dart';
import 'package:icapps_translations_example/util/locale/localization_overrides.dart';
import 'package:intl/intl.dart';
import 'package:sprintf/sprintf.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//

typedef LocaleFilter = bool Function(String languageCode);

class Localization {
  LocaleFilter? localeFilter;

  var _localisedValues = <String, dynamic>{};
  var _localisedOverrideValues = <String, dynamic>{};

  /// The locale is used to get the correct json locale.
  /// It can later be used to check what the locale is that was used to load this Localization instance.
  Locale? locale;

  static const defaultLocale = Locale.fromSubtags(
      languageCode: 'nl', scriptCode: null, countryCode: null);

  static const _supportedLocales = [
    Locale.fromSubtags(languageCode: 'nl', scriptCode: null, countryCode: null),
    Locale.fromSubtags(languageCode: 'en', scriptCode: null, countryCode: null),
  ];

  List<String> get supportedLanguages {
    final supportedLanguageTags =
        _supportedLocales.map((e) => e.toLanguageTag()).toList(growable: false);
    if (localeFilter == null) return supportedLanguageTags;
    return supportedLanguageTags
        .where((element) => localeFilter?.call(element) ?? true)
        .toList();
  }

  List<Locale> get supportedLocales {
    if (localeFilter == null) return _supportedLocales;
    return _supportedLocales
        .where((element) => localeFilter?.call(element.toLanguageTag()) ?? true)
        .toList();
  }

  Future<void> load({
    Locale? locale,
    LocalizationOverrides? localizationOverrides,
    bool showLocalizationKeys = false,
    bool useCaching = true,
  }) async {
    final currentLocale = locale ?? defaultLocale;
    this.locale = currentLocale;
    if (showLocalizationKeys) {
      _localisedValues.clear();
      _localisedOverrideValues.clear();
      return;
    }
    if (localizationOverrides != null) {
      final overrideLocalizations =
          await localizationOverrides.getOverriddenLocalizations(currentLocale);
      _localisedOverrideValues = overrideLocalizations;
    }
    final jsonContent = await rootBundle.loadString(
        'assets/localization/${currentLocale.toLanguageTag()}.json',
        cache: useCaching);
    _localisedValues = json.decode(jsonContent) as Map<String, dynamic>;
  }

  String _t(String key, {List<dynamic>? args}) {
    try {
      final value =
          (_localisedOverrideValues[key] ?? _localisedValues[key]) as String?;
      if (value == null) return key;
      if (args == null || args.isEmpty) return value;
      return sprintf(value, args);
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  String _plural(String key, {required num count, List<dynamic>? args}) {
    try {
      final value = (_localisedOverrideValues[key] ?? _localisedValues[key])
          as Map<String, dynamic>?;
      if (value == null) return key;

      final pluralValue = Intl.plural(
        count,
        zero: value['zero'] as String?,
        one: value['one'] as String?,
        two: value['two'] as String?,
        few: value['few'] as String?,
        many: value['many'] as String?,
        other: value['other'] as String,
      );
      if (args == null || args.isEmpty) return pluralValue;
      return sprintf(pluralValue, args);
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  /// Translations:
  ///
  /// nl:  **'Test in het Nederlands'**
  ///
  /// en:  **'Testing in English'**
  String get test => _t(LocalizationKeys.test);

  /// Translations:
  ///
  /// nl:  **'Test argument [arg1 string]'**
  ///
  /// en:  **'Testing argument [arg1 string]'**
  String testArg1(String arg1) =>
      _t(LocalizationKeys.testArg1, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// nl:  **'Test argument [arg1 number]'**
  ///
  /// en:  **'Testing argument [arg1 number]'**
  String testArg2(int arg1) =>
      _t(LocalizationKeys.testArg2, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// nl:  **'Test argument [arg1 string] [arg2 number]'**
  ///
  /// en:  **'Testing argument [arg1 string] [arg2 number]'**
  String testArg3(String arg1, int arg2) =>
      _t(LocalizationKeys.testArg3, args: <dynamic>[arg1, arg2]);

  /// Translations:
  ///
  /// nl:  **'Test argument [arg1 string] [arg2 number] [arg1 string]'**
  ///
  /// en:  **'Testing argument [arg1 string] [arg2 number] [arg1 string]'**
  String testArg4(String arg1, int arg2) =>
      _t(LocalizationKeys.testArg4, args: <dynamic>[arg1, arg2]);

  /// Translations:
  ///
  /// nl:  **'Hallo daar'**
  ///
  /// en:  **''**
  String get welcomeMessage => _t(LocalizationKeys.welcomeMessage);

  /// Translations:
  ///
  /// nl:  **'Test\nargument\n\n[arg1 string] [arg2 number] [arg1 string]'**
  ///
  /// en:  **'Testing\nargument\n\n[arg1 string] [arg2 number] [arg1 string]'**
  String testNewLine(String arg1, int arg2) =>
      _t(LocalizationKeys.testNewLine, args: <dynamic>[arg1, arg2]);

  /// Translations:
  ///
  /// nl:  **'Carriage\r\nReturn'**
  ///
  /// en:  **'Carriage\r\nReturn'**
  String get testNewLineCarriageReturn =>
      _t(LocalizationKeys.testNewLineCarriageReturn);

  /// Translations:
  ///
  /// nl:  **'Test niet positioneel argument %s en %f'**
  ///
  /// en:  **'Testing non positional argument %s and %.02f'**
  String testNonPositional(String arg1, double arg2) =>
      _t(LocalizationKeys.testNonPositional, args: <dynamic>[arg1, arg2]);

  /// Translations:
  ///
  /// nl:  **'{one: %d uur, other: %d uren}'**
  ///
  /// en:  **'{one: %d hour, other: %d hours}'**
  String testPlural(num count, int arg1) =>
      _plural(LocalizationKeys.testPlural, count: count, args: <dynamic>[arg1]);

  String getTranslation(String key, {List<dynamic>? args}) =>
      _t(key, args: args ?? <dynamic>[]);
}
