import 'package:http/http.dart' as http;

import '../params.dart';
import 'json_translation_downloader.dart';

const _baseUrl = 'https://translate.icapps.com/api/project';

class NewIcappsTranslationDownloader extends JSonTranslationDownloader {
  const NewIcappsTranslationDownloader(Params params) : super(params);

  @override
  Future<String> downloadJson(String language) async {
    final headers = <String, String>{}
      ..putIfAbsent('accept', () => 'application/json')
      ..putIfAbsent('Authorization', () => 'Bearer ${params.apiKey}');
    final url = '$_baseUrl/${params.projectId}/translations/$language';
    final response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode != 200) {
      throw Exception(
          '\n\nFailed to get $url with status code ${response.statusCode}\n');
    }
    return response.body;
  }
}
