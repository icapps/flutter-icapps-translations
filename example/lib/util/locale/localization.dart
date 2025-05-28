import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:icapps_translations_example/util/locale/localization_keys.dart';
import 'package:icapps_translations_example/util/locale/localization_overrides.dart';
import 'package:sprintf/sprintf.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//

typedef LocaleFilter = bool Function(String languageCode);

class Localization {
  LocaleFilter? localeFilter;

  var _localisedValues = <String, dynamic>{};
  var _localisedOverrideValues = <String, dynamic>{};

  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization)!;

  /// The locale is used to get the correct json locale.
  /// It can later be used to check what the locale is that was used to load this Localization instance.
  final Locale? locale;

  Localization({required this.locale});

  static Future<Localization> load({
    required Locale locale, 
    LocalizationOverrides? localizationOverrides,
    bool showLocalizationKeys = false,
    bool useCaching = true,
    AssetBundle? bundle,
    }) async {
    final localizations = Localization(locale: locale);
    if (showLocalizationKeys) {
      return localizations;
    }
    if (localizationOverrides != null) {
      final overrideLocalizations = await localizationOverrides.getOverriddenLocalizations(locale);
      localizations._localisedOverrideValues = overrideLocalizations;
    }
    final jsonContent = await (bundle ?? rootBundle).loadString('assets/localization/${locale.toLanguageTag()}.json', cache: useCaching);
    localizations._localisedValues = json.decode(jsonContent) as Map<String, dynamic>;
    return localizations;
  }

  String _t(String key, {List<dynamic>? args}) {
    try {
      final value = (_localisedOverrideValues[key] ?? _localisedValues[key]) as String?;
      if (value == null) return key;
      if (args == null || args.isEmpty) return value;
      return sprintf(value, args);
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  /// Translations:
  ///
  /// en:  **'Animations'**
  ///
  /// nl:  **'Animaties'**
  String get debugAnimationsTitle => _t(LocalizationKeys.debugAnimationsTitle);

  /// Translations:
  ///
  /// en:  **'Database'**
  ///
  /// nl:  **'Database'**
  String get debugDatabase => _t(LocalizationKeys.debugDatabase);

  /// Translations:
  ///
  /// en:  **'View licenses'**
  ///
  /// nl:  **'Bekijk de licenties'**
  String get debugLicensesGoTo => _t(LocalizationKeys.debugLicensesGoTo);

  /// Translations:
  ///
  /// en:  **'Licenses'**
  ///
  /// nl:  **'Licenties'**
  String get debugLicensesTitle => _t(LocalizationKeys.debugLicensesTitle);

  /// Translations:
  ///
  /// en:  **'Current language: [arg1 string]'**
  ///
  /// nl:  **'Huidige taal: [arg1 string]'**
  String debugLocaleCurrentLanguage(String arg1) => _t(LocalizationKeys.debugLocaleCurrentLanguage, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// en:  **'Select your language'**
  ///
  /// nl:  **'Selecteer uw taal'**
  String get debugLocaleSelector => _t(LocalizationKeys.debugLocaleSelector);

  /// Translations:
  ///
  /// en:  **'Language'**
  ///
  /// nl:  **'Taal'**
  String get debugLocaleTitle => _t(LocalizationKeys.debugLocaleTitle);

  /// Translations:
  ///
  /// en:  **'Native bridge'**
  ///
  /// nl:  **'Native brug'**
  String get debugNativeBridge => _t(LocalizationKeys.debugNativeBridge);

  /// Translations:
  ///
  /// en:  **'Send native log'**
  ///
  /// nl:  **'Stuur native log'**
  String get debugNativeBridgeLog => _t(LocalizationKeys.debugNativeBridgeLog);

  /// Translations:
  ///
  /// en:  **'Show translations'**
  ///
  /// nl:  **'Toon vertalingen'**
  String get debugShowTranslations => _t(LocalizationKeys.debugShowTranslations);

  /// Translations:
  ///
  /// en:  **'Slow animations'**
  ///
  /// nl:  **'Trage animaties'**
  String get debugSlowAnimations => _t(LocalizationKeys.debugSlowAnimations);

  /// Translations:
  ///
  /// en:  **'Current platfrom: [arg1 string]'**
  ///
  /// nl:  **'Huidig platfrom: [arg1 string]'**
  String debugTargetPlatformSubtitle(String arg1) => _t(LocalizationKeys.debugTargetPlatformSubtitle, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// en:  **'Target platfrom'**
  ///
  /// nl:  **'Doelplatform'**
  String get debugTargetPlatformTitle => _t(LocalizationKeys.debugTargetPlatformTitle);

  /// Translations:
  ///
  /// en:  **'Theme'**
  ///
  /// nl:  **'Thema'**
  String get debugThemeTitle => _t(LocalizationKeys.debugThemeTitle);

  /// Translations:
  ///
  /// en:  **'Debug'**
  ///
  /// nl:  **'Debuggen'**
  String get debugTitle => _t(LocalizationKeys.debugTitle);

  /// Translations:
  ///
  /// en:  **'Translation Keys'**
  ///
  /// nl:  **'Vertaling sluitels'**
  String get debugTranslationsTitle => _t(LocalizationKeys.debugTranslationsTitle);

  /// Translations:
  ///
  /// en:  **'View database'**
  ///
  /// nl:  **'Toon database'**
  String get debugViewDatabase => _t(LocalizationKeys.debugViewDatabase);

  /// Translations:
  ///
  /// en:  **'Bad request error'**
  ///
  /// nl:  **'Foute request error'**
  String get errorBadRequest => _t(LocalizationKeys.errorBadRequest);

  /// Translations:
  ///
  /// en:  **'You coded something wrong'**
  ///
  /// nl:  **'Je hebt een programmeerfout gemaakt'**
  String get errorDuringDev => _t(LocalizationKeys.errorDuringDev);

  /// Translations:
  ///
  /// en:  **'Forbidden error'**
  ///
  /// nl:  **'Geen toegang error'**
  String get errorForbidden => _t(LocalizationKeys.errorForbidden);

  /// Translations:
  ///
  /// en:  **'Something went wrong'**
  ///
  /// nl:  **'Er liep iets mis'**
  String get errorGeneral => _t(LocalizationKeys.errorGeneral);

  /// Translations:
  ///
  /// en:  **'Something went wrong (code: [arg1 string])'**
  ///
  /// nl:  **'Er liep iets mis (code: [arg1 string])'**
  String errorGeneralWithCode(String arg1) => _t(LocalizationKeys.errorGeneralWithCode, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// en:  **'Internal server error'**
  ///
  /// nl:  **'Intern server probleem'**
  String get errorInternalServer => _t(LocalizationKeys.errorInternalServer);

  /// Translations:
  ///
  /// en:  **'No internet connection available'**
  ///
  /// nl:  **'Geen internet verbinding beschikbaar'**
  String get errorNoNetwork => _t(LocalizationKeys.errorNoNetwork);

  /// Translations:
  ///
  /// en:  **'Unauthorized error'**
  ///
  /// nl:  **'Ongeautoriseerde fout'**
  String get errorUnauthorized => _t(LocalizationKeys.errorUnauthorized);

  /// Translations:
  ///
  /// en:  **'Android'**
  ///
  /// nl:  **'Android'**
  String get generalLabelAndroid => _t(LocalizationKeys.generalLabelAndroid);

  /// Translations:
  ///
  /// en:  **'Cancel'**
  ///
  /// nl:  **'Annuleer'**
  String get generalLabelCancel => _t(LocalizationKeys.generalLabelCancel);

  /// Translations:
  ///
  /// en:  **'Delete'**
  ///
  /// nl:  **'Verwijder'**
  String get generalLabelDelete => _t(LocalizationKeys.generalLabelDelete);

  /// Translations:
  ///
  /// en:  **'iOS'**
  ///
  /// nl:  **'iOS'**
  String get generalLabelIos => _t(LocalizationKeys.generalLabelIos);

  /// Translations:
  ///
  /// en:  **'No'**
  ///
  /// nl:  **'Nee'**
  String get generalLabelNo => _t(LocalizationKeys.generalLabelNo);

  /// Translations:
  ///
  /// en:  **'Ok'**
  ///
  /// nl:  **'Ok'**
  String get generalLabelOk => _t(LocalizationKeys.generalLabelOk);

  /// Translations:
  ///
  /// en:  **'Save'**
  ///
  /// nl:  **'Opslaan'**
  String get generalLabelSave => _t(LocalizationKeys.generalLabelSave);

  /// Translations:
  ///
  /// en:  **'System default'**
  ///
  /// nl:  **'Systeem standaard'**
  String get generalLabelSystemDefault => _t(LocalizationKeys.generalLabelSystemDefault);

  /// Translations:
  ///
  /// en:  **'Yes'**
  ///
  /// nl:  **'Ja'**
  String get generalLabelYes => _t(LocalizationKeys.generalLabelYes);

  /// Translations:
  ///
  /// en:  **'Settings'**
  ///
  /// nl:  **'Instellingen'**
  String get settingsTitle => _t(LocalizationKeys.settingsTitle);

  /// Translations:
  ///
  /// en:  **'Enter your todo'**
  ///
  /// nl:  **'Vul hier uw todo in'**
  String get todoAddInputHint => _t(LocalizationKeys.todoAddInputHint);

  /// Translations:
  ///
  /// en:  **'Add todo'**
  ///
  /// nl:  **'Todo toevoegen'**
  String get todoAddTitle => _t(LocalizationKeys.todoAddTitle);

  /// Translations:
  ///
  /// en:  **'No data added to your database. Fetch some todos with an api call (download icon) or add one yourself by clicking the add icon.'**
  ///
  /// nl:  **'Er is nog geen data toegevoegd in uw database. Je kan een paar todo's ophalen van een api calll (download icoon) of je kan er zelf toevoegen door op het plus icoon te drukken.'**
  String get todoEmptyState => _t(LocalizationKeys.todoEmptyState);

  /// Translations:
  ///
  /// en:  **'Todo'**
  ///
  /// nl:  **'Todo'**
  String get todoTitle => _t(LocalizationKeys.todoTitle);

  /// Translations:
  ///
  /// en:  **'Theme'**
  ///
  /// nl:  **'Thema'**
  String get debugThemeModeTitle => _t(LocalizationKeys.debugThemeModeTitle);

  /// Translations:
  ///
  /// en:  **'Show the app in dark mode or light'**
  ///
  /// nl:  **'Toon de app in dark mode of light'**
  String get debugThemeModeSubtitle => _t(LocalizationKeys.debugThemeModeSubtitle);

  /// Translations:
  ///
  /// en:  **'Light'**
  ///
  /// nl:  **'Light'**
  String get themeModeLabelLight => _t(LocalizationKeys.themeModeLabelLight);

  /// Translations:
  ///
  /// en:  **'Dark'**
  ///
  /// nl:  **'Dark'**
  String get themeModeLabelDark => _t(LocalizationKeys.themeModeLabelDark);

  /// Translations:
  ///
  /// en:  **'System default'**
  ///
  /// nl:  **'Systeem standaard'**
  String get themeModeLabelSystem => _t(LocalizationKeys.themeModeLabelSystem);

  /// Translations:
  ///
  /// en:  **'Help us improve'**
  ///
  /// nl:  **'Help ons verbeteren'**
  String get permissionAnalyticsTitle => _t(LocalizationKeys.permissionAnalyticsTitle);

  /// Translations:
  ///
  /// en:  **'We would love to know how you use our app. This helps us to improve your user experience. No personal data is collected. '**
  ///
  /// nl:  **'Wij willen graag weten hoe je de app gebruikt. Dit helpt ons je gebruikservaring beter te maken. We sturen hierbij geen persoonsgegevens door. '**
  String get permissionAnalyticsDescription => _t(LocalizationKeys.permissionAnalyticsDescription);

  /// Translations:
  ///
  /// en:  **'Accept'**
  ///
  /// nl:  **'Toestaan'**
  String get permissionButtonAccept => _t(LocalizationKeys.permissionButtonAccept);

  /// Translations:
  ///
  /// en:  **'Decline'**
  ///
  /// nl:  **'Weigeren'**
  String get permissionButtonDecline => _t(LocalizationKeys.permissionButtonDecline);

  /// Translations:
  ///
  /// en:  **'More info'**
  ///
  /// nl:  **'Meer informatie'**
  String get permissionButtonMoreInfo => _t(LocalizationKeys.permissionButtonMoreInfo);

  /// Translations:
  ///
  /// en:  **'Permissions'**
  ///
  /// nl:  **'Permissies'**
  String get debugPermissionsTitle => _t(LocalizationKeys.debugPermissionsTitle);

  /// Translations:
  ///
  /// en:  **'Show analytics permission screen'**
  ///
  /// nl:  **'Toon analytics permissie scherm '**
  String get debugPermissionsShowAnalyticsPermission => _t(LocalizationKeys.debugPermissionsShowAnalyticsPermission);

  /// Translations:
  ///
  /// en:  **'Reset analytics permission'**
  ///
  /// nl:  **'Reset analytics permissie'**
  String get debugPermissionResetAnalytics => _t(LocalizationKeys.debugPermissionResetAnalytics);

  /// Translations:
  ///
  /// en:  **'Analytics permission'**
  ///
  /// nl:  **'Analytics permissie'**
  String get semanticAnalyticsScreenImage => _t(LocalizationKeys.semanticAnalyticsScreenImage);

  /// Translations:
  ///
  /// en:  **'Download todo's'**
  ///
  /// nl:  **'Download todo's'**
  String get semanticTodoListScreenDownloadAction => _t(LocalizationKeys.semanticTodoListScreenDownloadAction);

  /// Translations:
  ///
  /// en:  **'Voeg todo toe'**
  ///
  /// nl:  **'Add todo'**
  String get semanticTodoListScreenAddAction => _t(LocalizationKeys.semanticTodoListScreenAddAction);

  /// Translations:
  ///
  /// en:  **'Toggle $1%s'**
  ///
  /// nl:  **'Toggle $1%s'**
  String semanticToggle(String arg1) => _t(LocalizationKeys.semanticToggle, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// en:  **'Aan'**
  ///
  /// nl:  **'On'**
  String get semanticToggleOn => _t(LocalizationKeys.semanticToggleOn);

  /// Translations:
  ///
  /// en:  **'Off'**
  ///
  /// nl:  **'Uit'**
  String get semanticToggleOff => _t(LocalizationKeys.semanticToggleOff);

  /// Translations:
  ///
  /// en:  **'Bottom navigation item $1%s'**
  ///
  /// nl:  **'Bottom navigation item $1%s'**
  String semanticBottomNavigationItem(String arg1) => _t(LocalizationKeys.semanticBottomNavigationItem, args: <dynamic>[arg1]);

  /// Translations:
  ///
  /// en:  **'Back'**
  ///
  /// nl:  **'Terug'**
  String get semanticBack => _t(LocalizationKeys.semanticBack);

  String getTranslation(String key, {List<dynamic>? args}) => _t(key, args: args ?? <dynamic>[]);

}
