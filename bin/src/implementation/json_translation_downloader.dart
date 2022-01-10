import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';

import '../icapps_translations_downloader.dart';
import '../params.dart';

abstract class JSonTranslationDownloader
    implements IcappsTranslationDownloader {
  final Params params;

  const JSonTranslationDownloader(this.params);

  Future<String> downloadJson(String language);

  @override
  Future<void> fetchTranslations(String language) async {
    print('Updating $language...');
    final file = File(
        join(Directory.current.path, params.localeAssetsDir, '$language.json'));
    const encoder = JsonEncoder.withIndent('  ');

    final jsonString = await downloadJson(language);

    final changedBody = jsonString.replaceAll(r'\\n', r'\n');
    final body = json.decode(changedBody) as Map<String, dynamic>;
    final translations =
        body['translations'] as Map<String, dynamic>? ?? <String, dynamic>{};
    file.writeAsStringSync(encoder.convert(translations));
  }
}
