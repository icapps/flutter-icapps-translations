import 'dart:async';
import 'dart:io';

import 'package:locale_gen/locale_gen.dart';
import 'package:path/path.dart';

import 'src/icapps_translations_downloader.dart';
import 'src/params.dart';

const programName = 'icapps_translations';

Future<void> main(List<String> args) async {
  final params = Params(programName);

  final downloader = IcappsTranslationDownloader.create(params);

  await Future.wait(params.languages
      .map((language) async => downloader.fetchTranslations(language))
      .toList());

  final localeFolder =
      Directory(join(Directory.current.path, params.localeAssetsDir));
  if (!localeFolder.existsSync()) {
    print('${params.localeAssetsDir} folder does not yet exist.');
    print('Creating folder...');
    localeFolder.createSync(recursive: true);
  }

  LocaleGenWriter.write(params);
}
