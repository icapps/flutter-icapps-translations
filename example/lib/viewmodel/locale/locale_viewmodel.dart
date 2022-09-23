import 'package:flutter/material.dart';
import 'package:icapps_translations_example/repository/locale_repository.dart';
import 'package:icapps_translations_example/util/locale/localization.dart';

class LocaleViewModel with ChangeNotifier {
  final LocaleRepository _localeRepository;

  LocaleViewModel(this._localeRepository);

  void init() {
    initLocale();
  }

  Future<void> initLocale() async {
    final locale = await _localeRepository.getCustomLocale();
    await Localization.load(locale: locale);
    notifyListeners();
  }

  Future<void> onSwitchToDutch() async {
    await _onUpdateLocaleClicked(const Locale('nl'));
  }

  Future<void> onSwitchToEnglish() async {
    await _onUpdateLocaleClicked(const Locale('en'));
  }

  Future<void> onSwitchToSystemLanguage() async {
    await _onUpdateLocaleClicked(null);
  }

  Future<void> _onUpdateLocaleClicked(Locale? locale) async {
    await _localeRepository.setCustomLocale(locale);
    await Localization.load(locale: locale);
    notifyListeners();
  }
}
