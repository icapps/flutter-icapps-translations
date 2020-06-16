import 'dart:io';

import 'package:yaml/yaml.dart';

import '../icapps_translations.dart';

class Params {
  static const icappsTranslationsYaml = 'icapps_translations';
  static const ENV_API_KEY = 'API_KEY_ICAPPS_TRANSLATIONS';

  String apiKey;
  String projectName;
  String defaultLanguage;
  List<String> languages;

  Params(pubspecContent) {
    final doc = loadYaml(pubspecContent);
    projectName = doc['name'];

    if (projectName == null || projectName.isEmpty) {
      throw Exception('Could not parse the pubspec.yaml, project name not found');
    }

    final config = doc[icappsTranslationsYaml];
    if (config == null) {
      throw Exception('Could not parse the pubspec.yaml, icapps_translations not found or misconfigured');
    }

    apiKey = config['api_key'];

    if (apiKey == null || apiKey.isEmpty) {
      final envVars = Platform.environment;
      apiKey = envVars[ENV_API_KEY];
    }

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('A api_key should be added to the icapps_translations section in the pubspec.yaml\n'
          '$icappsTranslationsYaml'
          "  api_key: 'your-api-key'");
    }

    final YamlList yamlList = config['languages'];
    if (yamlList == null || yamlList.isEmpty) {
      throw Exception("At least 1 language should be added to the 'languages' section in the pubspec.yaml\n"
          '$icappsTranslationsYaml'
          "  languages: ['en']");
    }

    languages = yamlList.map((item) => item.toString()).toList();
    if (languages == null || languages.isEmpty) {
      throw Exception("At least 1 language should be added to the 'languages' section in the pubspec.yaml\n"
          '$icappsTranslationsYaml'
          "  languages: ['en']");
    }

    defaultLanguage = config['default_language'];
    if (defaultLanguage == null) {
      if (languages.contains('en')) {
        defaultLanguage = 'en';
      } else {
        defaultLanguage = languages[0];
      }
    }
    if (!languages.contains(defaultLanguage)) {
      throw Exception('default language is not included in the languages list');
    }

    localeAssetsDir = config['locale_assets_path'];
    localeAssetsDir ??= defaultAssetsDir;
    if (!localeAssetsDir.endsWith('/')) {
      localeAssetsDir += '/';
    }

    assetsDir = config['assets_path'];
    assetsDir ??= defaultAssetsDir;
    if (!assetsDir.endsWith('/')) {
      assetsDir += '/';
    }
  }
}
