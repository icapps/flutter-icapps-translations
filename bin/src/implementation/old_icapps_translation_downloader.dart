import 'package:http/http.dart' as http;

import '../params.dart';
import 'json_translation_downloader.dart';

const _baseUrl = 'https://translations.icapps.com/api/translations/';

class OldIcappsTranslationDownloader extends JsonTranslationDownloader {
  const OldIcappsTranslationDownloader(Params params) : super(params);

  @override
  Future<String> downloadJson(String language) async {
    final headers = <String, String>{}
      ..putIfAbsent('Content-type', () => 'application/json')
      ..putIfAbsent('Authorization', () => 'Token token=${params.apiKey}');
    final url = '$_baseUrl$language.json';
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception(
          '\n\nFailed to get $url with status code ${response.statusCode}\n');
    }
    return response.body;
  }
}
