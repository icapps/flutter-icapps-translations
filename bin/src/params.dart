import 'dart:io';

import 'package:locale_gen/locale_gen.dart';
import 'package:path/path.dart';

class Params extends LocaleGenParams {
  static const ENV_API_KEY = 'API_KEY_ICAPPS_TRANSLATIONS';

  String? apiKey;

  factory Params(String programName) {
    final pubspecYaml = File(join(Directory.current.path, 'pubspec.yaml'));
    if (!pubspecYaml.existsSync()) {
      throw Exception(
          'This program should be run from the root of a flutter/dart project');
    }

    final pubspecContent = pubspecYaml.readAsStringSync();
    return Params.fromYamlString(programName, pubspecContent);
  }

  Params.fromYamlString(String programName, String pubspecContent)
      : super.fromYamlString(programName, pubspecContent);

  @override
  void configure(config) {
    super.configure(config);
    apiKey = config['api_key'];

    if (apiKey == null || apiKey?.isEmpty == true) {
      final envVars = Platform.environment;
      apiKey = envVars[ENV_API_KEY];
    }

    if (apiKey == null || apiKey?.isEmpty == true) {
      throw Exception(
          'A api_key should be added to the $programName section in the pubspec.yaml\n'
          '$programName'
          "  api_key: 'your-api-key'");
    }
  }
}
