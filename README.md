# flutter icapps translations

A dart package to automaticly download translations from the icapps translation tool.

[![pub package](https://img.shields.io/pub/v/icapps_translations.svg)](https://pub.dartlang.org/packages/icapps_translations)

This repo contains an example how to use this package.

Packages used:
 - flutter_localizations
 - provider
 - kiwi
 - icapps_translations

## Example

<img src="assets/example.gif" alt="Example" width="300"/>

## Setup

### Add dependency to pubspec

[![pub package](https://img.shields.io/pub/v/icapps_translations.svg)](https://pub.dartlang.org/packages/icapps_translations)
```
dev-dependencies:
  icapps-translations: <latest-version>
```

### Add config to pubspec

Add your locale folder to the assets to make use all your translations are loaded.
```
flutter:
  assets:
    - assets/locale/
```

Add the icapps_translations config to fetch the latest translations
```
icapps_translations:
  api_key: 'enter-your-api-key'
  default_language: 'nl'
  languages: ['en', 'nl']
```

set an env variable for your api_key

```
API_KEY_ICAPPS_TRANSLATIONS
```

### Run package with Flutter

```
flutter packages pub run icapps_translations
```

### Run package with Dart

```
pub run icapps_translations
```
