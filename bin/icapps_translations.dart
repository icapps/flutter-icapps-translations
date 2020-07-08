import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'src/case_util.dart';
import 'src/params.dart';
import 'src/translation_file_writer.dart';

const baseUrl = 'https://translations.icapps.com/api/translations/';

final defaultOutputDir = join('lib', 'util', 'locale');
final defaultAssetsDir = join('assets', 'locale');

final outputDir = defaultOutputDir;
var localeAssetsDir = defaultAssetsDir;
var assetsDir = defaultAssetsDir;

Params params;
Map<String, dynamic> defaultTranslations;

Future<void> main(List<String> args) async {
  final pubspecYaml = File(join(Directory.current.path, 'pubspec.yaml'));
  if (!pubspecYaml.existsSync()) {
    throw Exception(
        'This program should be run from the root of a flutter/dart project');
  }

  await parsePubspec(pubspecYaml);

  final localeFolder = Directory(join(Directory.current.path, localeAssetsDir));
  if (!localeFolder.existsSync()) {
    print('$localeAssetsDir folder does not yet exist.');
    print('Creating folder...');
    localeFolder.createSync(recursive: true);
  }

  await Future.wait(
      params.languages.map((language) async => _buildJson(language)).toList());

  createLocalizationKeysFile();
  createLocalizationFile();
  createLocalizationDelegateFile();
  print('Done!!!');
}

Future<void> parsePubspec(File pubspecYaml) async {
  final pubspecContent = pubspecYaml.readAsStringSync();
  params = Params(pubspecContent);
  print('Default language: ${params.defaultLanguage}');
  print('Supported languages: ${params.languages}');
}

Future<void> _buildJson(String language) async {
  print('Updating $language...');
  final headers = Map<String, String>()
    ..putIfAbsent('Content-type', () => 'application/json')
    ..putIfAbsent('Authorization', () => 'Token token=${params.apiKey}');
  final url = '$baseUrl$language.json';
  final response = await http.get(url, headers: headers);
  if (response.statusCode != 200) {
    throw Exception(
        '\n\nFailed to get $url with statuscode ${response.statusCode}\n');
  }
  final file =
      File(join(Directory.current.path, localeAssetsDir, '$language.json'));
  const encoder = JsonEncoder.withIndent('  ');
  final changedBody = response.body.replaceAll(r'\\n', r'\n');
  final body = json.decode(changedBody);
  final translations = body['translations'] ?? Map<String, dynamic>();
  file.writeAsStringSync(encoder.convert(translations));
  if (language == params.defaultLanguage) {
    defaultTranslations = translations;
  }
}

void createLocalizationKeysFile() {
  final sb = StringBuffer()
    ..writeln(
        '//============================================================//')
    ..writeln('//THIS FILE IS AUTO GENERATED. DO NOT EDIT//')
    ..writeln(
        '//============================================================//')
    ..writeln('class LocalizationKeys {')
    ..writeln();
  defaultTranslations.forEach((key, value) {
    final correctKey = CaseUtil.getCamelcase(key);
    sb..writeln('  static const $correctKey = \'$key\';')..writeln();
  });
  sb.writeln('}');

  // Write to file
  final localizationKeysFile =
      File(join(Directory.current.path, outputDir, 'localization_keys.dart'));
  if (!localizationKeysFile.existsSync()) {
    print('localization_keys.dart does not exists');
    print('Creating localization_keys.dart ...');
    localizationKeysFile.createSync(recursive: true);
  }
  localizationKeysFile.writeAsStringSync(sb.toString());
}

void createLocalizationFile() {
  final sb = StringBuffer()
    ..writeln("import 'dart:convert';")
    ..writeln()
    ..writeln("import 'package:flutter/services.dart';")
    ..writeln("import 'package:flutter/widgets.dart';")
    ..writeln(
        "import 'package:${params.projectName}/util/locale/localization_keys.dart';")
    ..writeln()
    ..writeln(
        '//============================================================//')
    ..writeln('//THIS FILE IS AUTO GENERATED. DO NOT EDIT//')
    ..writeln(
        '//============================================================//')
    ..writeln('class Localization {')
    ..writeln('  Map<String, String> _localisedValues = Map();')
    ..writeln()
    ..writeln(
        '  static Localization of(BuildContext context) => Localizations.of<Localization>(context, Localization);')
    ..writeln()
    ..writeln(
        '  static Future<Localization> load(Locale locale, {bool showLocalizationKeys = false}) async {')
    ..writeln('    final localizations = Localization();')
    ..writeln('    if (showLocalizationKeys) {')
    ..writeln('      return localizations;')
    ..writeln('    }')
    ..writeln(
        "    final jsonContent = await rootBundle.loadString('$assetsDir\${locale.languageCode}.json');")
    ..writeln(
        '    // ignore: avoid_as')
    ..writeln('    localizations._localisedValues = json.decode(jsonContent) as Map<String,String>;')
    ..writeln('    return localizations;')
    ..writeln('  }')
    ..writeln()
    ..writeln('  String _t(String key, {List<dynamic> args}) {')
    ..writeln('    try {')
    ..writeln('      var value = _localisedValues[key];')
    ..writeln("      if (value == null) return '\$key';")
    ..writeln('      if (args == null || args.isEmpty) return value;')
    ..writeln(
        '      args.asMap().forEach((index, arg) => value = _replaceWith(value, arg, index + 1));')
    ..writeln('      return value;')
    ..writeln('    } catch (e) {')
    ..writeln("      return '⚠\$key⚠';")
    ..writeln('    }')
    ..writeln('  }')
    ..writeln()
    ..writeln('  String _replaceWith(String value, arg, argIndex) {')
    ..writeln('    if (arg == null) return value;')
    ..writeln('    if (arg is String) {')
    ..writeln("      return value.replaceAll('%\$argIndex\\\$s', arg);")
    ..writeln('    } else if (arg is num) {')
    ..writeln("      return value.replaceAll('%\$argIndex\\\$d', '\$arg');")
    ..writeln('    }')
    ..writeln('    return value;')
    ..writeln('  }')
    ..writeln();
  defaultTranslations.forEach(
      (key, value) => FileWriter.buildTranslationFunction(sb, key, value));
  sb
    ..writeln(
        '  String getTranslation(String key, {List<dynamic> args}) => _t(key, args: args ?? List());')
    ..writeln()
    ..writeln('}');

  // Write to file
  final localizationFile =
      File(join(Directory.current.path, outputDir, 'localization.dart'));
  if (!localizationFile.existsSync()) {
    print('localization.dart does not exists');
    print('Creating localization.dart ...');
    localizationFile.createSync(recursive: true);
  }
  localizationFile.writeAsStringSync(sb.toString());
}

void createLocalizationDelegateFile() {
  final sb = StringBuffer()
    ..writeln("import 'dart:async';")
    ..writeln()
    ..writeln("import 'package:flutter/material.dart';")
    ..writeln(
        "import 'package:${params.projectName}/util/locale/localization.dart';")
    ..writeln()
    ..writeln(
        '//============================================================//')
    ..writeln('//THIS FILE IS AUTO GENERATED. DO NOT EDIT//')
    ..writeln(
        '//============================================================//')
    ..writeln(
        'class LocalizationDelegate extends LocalizationsDelegate<Localization> {')
    ..writeln(
        "  static const defaultLocale = Locale('${params.defaultLanguage}');")
    ..writeln('  static const supportedLanguages = [');
  params.languages.forEach((language) => sb.writeln("    '$language',"));
  sb
    ..writeln('  ];')
    ..writeln()
    ..writeln('  static const supportedLocales = [');
  params.languages
      .forEach((language) => sb.writeln("    Locale('$language'),"));
  sb
    ..writeln('  ];')
    ..writeln()
    ..writeln('  Locale newLocale;')
    ..writeln('  Locale activeLocale;')
    ..writeln('  bool showLocalizationKeys;')
    ..writeln()
    ..writeln(
        '  LocalizationDelegate({this.newLocale, this.showLocalizationKeys = false}) {')
    ..writeln('    if (newLocale != null) {')
    ..writeln('      activeLocale = newLocale;')
    ..writeln('    }')
    ..writeln('    showLocalizationKeys ??= false;')
    ..writeln('  }')
    ..writeln()
    ..writeln('  @override')
    ..writeln(
        '  bool isSupported(Locale locale) => supportedLanguages.contains(locale.languageCode);')
    ..writeln()
    ..writeln('  @override')
    ..writeln('  Future<Localization> load(Locale locale) async {')
    ..writeln('    activeLocale = newLocale ?? locale;')
    ..writeln(
        '    return Localization.load(activeLocale, showLocalizationKeys: showLocalizationKeys);')
    ..writeln('  }')
    ..writeln()
    ..writeln('  @override')
    ..writeln(
        '  bool shouldReload(LocalizationsDelegate<Localization> old) => true;')
    ..writeln()
    ..writeln('}');

  // Write to file
  final localizationDelegateFile = File(
      join(Directory.current.path, outputDir, 'localization_delegate.dart'));
  if (!localizationDelegateFile.existsSync()) {
    print('localization_delegate.dart does not exists');
    print('Creating localization_delegate.dart ...');
    localizationDelegateFile.createSync(recursive: true);
  }
  localizationDelegateFile.writeAsStringSync(sb.toString());
}
