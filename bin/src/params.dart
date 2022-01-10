import 'dart:io';

import 'package:locale_gen/locale_gen.dart';
import 'package:path/path.dart';

class Params extends LocaleGenParams {
  static const envApiKey = 'API_KEY_ICAPPS_TRANSLATIONS';
  static const envProjectId = 'PROJECT_ID_ICAPPS_TRANSLATIONS';

  String? _apiKey;
  String? _projectId;

  String get apiKey => _apiKey!;
  String get projectId => _projectId!;

  bool get useNew => _projectId != null;

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
    _apiKey = config['api_key'] as String?;
    _projectId = config['project_id'] as String?;

    if (_apiKey == null || _apiKey?.isEmpty == true) {
      _apiKey = Platform.environment[envApiKey];
    }
    if (_projectId == null || _projectId?.isEmpty == true) {
      _projectId = Platform.environment[envProjectId];
    }

    if (_apiKey == null || _apiKey?.isEmpty == true) {
      throw Exception(
          'A api_key should be added to the $programName section in the pubspec.yaml\n'
          '$programName'
          "  api_key: 'your-api-key'");
    }
  }
}
