import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

//============================================================//
//THIS FILE IS AUTO GENERATED. DO NOT EDIT//
//============================================================//
class Localization {
  Map<dynamic, dynamic> _localisedValues;

  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization);

  static Future<Localization> load(Locale locale) async {
    final localizations = Localization();
    print('Switching to ${locale.languageCode}');
    final jsonContent = await rootBundle.loadString('assets/locale/${locale.languageCode}.json');
    final Map<String, dynamic> values = json.decode(jsonContent);
    localizations._localisedValues = values;
    return localizations;
  }

  String _t(String key) {
    try {
      final value = _localisedValues[key];
      if (value == null) return '⚠$key⚠';
      return value;
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  String get appTitle => _t('app_title');

  String get companionScanBadgeActionEndSession => _t('companion_scan_badge_action_end_session');

  String get companionScanBadgeLabelUnknownBadge => _t('companion_scan_badge_label_unknown_badge');

  String get companionScanBadgeSubtitleScanned => _t('companion_scan_badge_subtitle_scanned');

  String get companionScanBadgeTitleNotScanned => _t('companion_scan_badge_title_not_scanned');

  String get companionScanBadgeTitleScanned => _t('companion_scan_badge_title_scanned');

  String get confirmationLabelBorrowSuccess => _t('confirmation_label_borrow_success');

  String get confirmationLabelLoadingSubtitle => _t('confirmation_label_loading_subtitle');

  String get confirmationLabelLoadingTitle => _t('confirmation_label_loading_title');

  String get confirmationLabelReturnSuccess => _t('confirmation_label_return_success');

  String get confirmationLabelSubtitle => _t('confirmation_label_subtitle');

  String get confirmationLabelSummary => _t('confirmation_label_summary');

  String get confirmationLabelSummaryLoading => _t('confirmation_label_summary_loading');

  String get homeActionBorrow => _t('home_action_borrow');

  String get homeActionReturn => _t('home_action_return');

  String get mainBottomNavAnalytics => _t('main_bottom_nav_analytics');

  String get mainBottomNavDevices => _t('main_bottom_nav_devices');

  String get mainBottomNavSettings => _t('main_bottom_nav_settings');

  String get mainBottomNavUsers => _t('main_bottom_nav_users');

  String get scanDeviceLabelNoLabelScanned => _t('scan_device_label_no_label_scanned');

  String get scanDeviceLabelNoSuchDevice => _t('scan_device_label_no_such_device');

  String get scanDeviceLabelTitle => _t('scan_device_label_title');

  String get searchDeviceBtnFilter => _t('search_device_btn_filter');

  String get searchDeviceFilterAlphabetical => _t('search_device_filter_alphabetical');

  String get searchDeviceFilterLabel => _t('search_device_filter_label');

  String get searchDeviceHint => _t('search_device_hint');

  String get searchDeviceNoResults => _t('search_device_no_results');

  String get searchDeviceTitleBorrow => _t('search_device_title_borrow');

  String get searchDeviceTitleReturn => _t('search_device_title_return');

  String get searchUserHint => _t('search_user_hint');

  String get searchUserNoResults => _t('search_user_no_results');

  String get userLabelNDevicesInUse => _t('user_label_n_devices_in_use');
}
