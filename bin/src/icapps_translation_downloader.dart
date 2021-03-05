import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'params.dart';

const _baseUrl = 'https://translations.icapps.com/api/translations/';

class IcappsTranslationDownloader {
  const IcappsTranslationDownloader._();

  static Future<void> fetchJson(Params params, String language) async {
    print('Updating $language...');
    final headers = Map<String, String>()
      ..putIfAbsent('Content-type', () => 'application/json')
      ..putIfAbsent('Authorization', () => 'Token token=${params.apiKey}');
    final url = '$_baseUrl$language.json';
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      if (response.statusCode != 200) {
        throw Exception(
            '\n\nFailed to get $url with status code ${response.statusCode}\n');
      }
      final file = File(join(
          Directory.current.path, params.localeAssetsDir, '$language.json'));
      const encoder = JsonEncoder.withIndent('  ');
      final changedBody = response.body.replaceAll(r'\\n', r'\n');
      final body = json.decode(changedBody);
      final translations = body['translations'] ?? Map<String, dynamic>();
      file.writeAsStringSync(encoder.convert(translations));
    } catch (e) {
      print(e);
      exit(-1);
    }
  }
}
