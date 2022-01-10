import 'implementation/new_icapps_translation_downloader.dart';
import 'implementation/old_icapps_translation_downloader.dart';
import 'params.dart';

abstract class IcappsTranslationDownloader {
  static IcappsTranslationDownloader create(Params params) {
    if (params.useNew) {
      print("Using new icapps tool...");
      return NewIcappsTranslationDownloader(params);
    }
    return OldIcappsTranslationDownloader(params);
  }

  Future<void> fetchTranslations(String language);
}
