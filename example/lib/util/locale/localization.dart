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

  String _t(String key, {List<dynamic> args}) {
    try {
      String value = _localisedValues[key];
      if (value == null) return '⚠$key⚠';
      if (args == null || args.isEmpty) return value;
      args.asMap().forEach((index, arg) => value = _replaceWith(value, arg, index));
      return value;
    } catch (e) {
      return '⚠$key⚠';
    }
  }

  String _replaceWith(String value, arg, argIndex) {
    if (arg == null) return value;
    if (arg is String) {
      return value.replaceAll('%$argIndex\$s', arg);
    } else if (arg is num) {
      return value.replaceAll('%$argIndex\$d', '$arg');
    }
    return value;
  }

  String get addDeviceLabelDeviceType => _t('add_device_label_device_type');

  String get addDeviceLabelImageUrl => _t('add_device_label_image_url');

  String get addDeviceLabelImei => _t('add_device_label_imei');

  String get addDeviceLabelLabel => _t('add_device_label_label');

  String get addDeviceLabelManufacturer => _t('add_device_label_manufacturer');

  String get addDeviceLabelModel => _t('add_device_label_model');

  String get addDeviceLabelOs => _t('add_device_label_os');

  String get addDeviceLabelSerialNr => _t('add_device_label_serial_nr');

  String get addDeviceLabelTestinium => _t('add_device_label_testinium');

  String get addDeviceTitle => _t('add_device_title');

  String get addUserLabelEmail => _t('add_user_label_email');

  String get addUserLabelFirstName => _t('add_user_label_first_name');

  String get addUserLabelLastName => _t('add_user_label_last_name');

  String get addUserLabelPictureUrl => _t('add_user_label_picture_url');

  String get addUserLabelTeam => _t('add_user_label_team');

  String get addUserTitle => _t('add_user_title');

  String get analyticsTitle => _t('analytics_title');

  String get appTitle => _t('app_title');

  String get companionScanBadgeActionEndSession => _t('companion_scan_badge_action_end_session');

  String get companionScanBadgeLabelUnknownBadge => _t('companion_scan_badge_label_unknown_badge');

  String get companionScanBadgeSubtitleScanned => _t('companion_scan_badge_subtitle_scanned');

  String get companionScanBadgeTitleNotScanned => _t('companion_scan_badge_title_not_scanned');

  String companionScanBadgeTitleScanned(String arg1) => _t('companion_scan_badge_title_scanned', args: [arg1]);

  String get confirmationLabelBorrowSuccess => _t('confirmation_label_borrow_success');

  String get confirmationLabelLoadingSubtitle => _t('confirmation_label_loading_subtitle');

  String get confirmationLabelLoadingTitle => _t('confirmation_label_loading_title');

  String get confirmationLabelReturnSuccess => _t('confirmation_label_return_success');

  String get confirmationLabelSubtitle => _t('confirmation_label_subtitle');

  String get confirmationLabelSummary => _t('confirmation_label_summary');

  String get confirmationLabelSummaryLoading => _t('confirmation_label_summary_loading');

  String deviceDetailLabelDeviceType(String arg1) => _t('device_detail_label_device_type', args: [arg1]);

  String deviceDetailLabelImei(String arg1) => _t('device_detail_label_imei', args: [arg1]);

  String deviceDetailLabelLabel(String arg1) => _t('device_detail_label_label', args: [arg1]);

  String deviceDetailLabelLastRentedAt(String arg1) => _t('device_detail_label_last_rented_at', args: [arg1]);

  String deviceDetailLabelManufacturer(String arg1) => _t('device_detail_label_manufacturer', args: [arg1]);

  String deviceDetailLabelModel(String arg1) => _t('device_detail_label_model', args: [arg1]);

  String deviceDetailLabelOs(String arg1) => _t('device_detail_label_os', args: [arg1]);

  String deviceDetailLabelRentedBy(String arg1) => _t('device_detail_label_rented_by', args: [arg1]);

  String deviceDetailLabelRentedCount(num arg1) => _t('device_detail_label_rented_count', args: [arg1]);

  String deviceDetailLabelSerialNr(String arg1) => _t('device_detail_label_serial_nr', args: [arg1]);

  String deviceDetailLabelTestinium(String arg1) => _t('device_detail_label_testinium', args: [arg1]);

  String get devicesLabelAddDevice => _t('devices_label_add_device');

  String get generalLabelCancel => _t('general_label_cancel');

  String get generalLabelDelete => _t('general_label_delete');

  String get generalLabelSave => _t('general_label_save');

  String get homeActionBorrow => _t('home_action_borrow');

  String get homeActionHistory => _t('home_action_history');

  String get homeActionReturn => _t('home_action_return');

  String get homeActionReturnYourDevices => _t('home_action_return_your_devices');

  String get loginButtonLogin => _t('login_button_login');

  String get loginLabelEmail => _t('login_label_email');

  String get loginLabelPassword => _t('login_label_password');

  String get mainBottomNavAnalytics => _t('main_bottom_nav_analytics');

  String get mainBottomNavDevices => _t('main_bottom_nav_devices');

  String get mainBottomNavSettings => _t('main_bottom_nav_settings');

  String get mainBottomNavUsers => _t('main_bottom_nav_users');

  String get returnUserDevicesTitle => _t('return_user_devices_title');

  String get scanDeviceLabelNoLabelScanned => _t('scan_device_label_no_label_scanned');

  String get scanDeviceLabelNoSuchDevice => _t('scan_device_label_no_such_device');

  String get scanDeviceLabelTitle => _t('scan_device_label_title');

  String get searchDeviceBtnFilter => _t('search_device_btn_filter');

  String get searchDeviceFilterAlphabetical => _t('search_device_filter_alphabetical');

  String get searchDeviceFilterLabel => _t('search_device_filter_label');

  String get searchDeviceFilterOther => _t('search_device_filter_other');

  String get searchDeviceHint => _t('search_device_hint');

  String get searchDeviceNoResults => _t('search_device_no_results');

  String get searchDeviceTitleBorrow => _t('search_device_title_borrow');

  String get searchDeviceTitleReturn => _t('search_device_title_return');

  String get searchUserHint => _t('search_user_hint');

  String get searchUserNoResults => _t('search_user_no_results');

  String get selectPictureTeamTitle => _t('select_picture_team_title');

  String get settingsLabelLanguage => _t('settings_label_language');

  String get settingsLabelSystemLanguage => _t('settings_label_system_language');

  String get settingsLabelSystemLanguageSubtitle => _t('settings_label_system_language_subtitle');

  String get settingsTitle => _t('settings_title');

  String userDetailLabelBadgeId(String arg1) => _t('user_detail_label_badge_id', args: [arg1]);

  String userDetailLabelEmail(String arg1) => _t('user_detail_label_email', args: [arg1]);

  String userDetailLabelFirstName(String arg1) => _t('user_detail_label_first_name', args: [arg1]);

  String userDetailLabelLastActiveAt(String arg1) => _t('user_detail_label_last_active_at', args: [arg1]);

  String userDetailLabelLastName(String arg1) => _t('user_detail_label_last_name', args: [arg1]);

  String userDetailLabelTeam(String arg1) => _t('user_detail_label_team', args: [arg1]);

  String userLabelNDevicesInUse(num arg1) => _t('user_label_n_devices_in_use', args: [arg1]);

  String get usersLabelAddUser => _t('users_label_add_user');

  String get usersLabelUserRented1Device => _t('users_label_user_rented_1_device');

  String usersLabelUserRentedAmountOfDevices(num arg1) => _t('users_label_user_rented_amount_of_devices', args: [arg1]);

}
