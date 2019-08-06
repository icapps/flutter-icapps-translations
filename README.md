# flutter icapps translations

A dart package to automaticly download translations from the icapps translation tool.

[![pub package](https://img.shields.io/pub/v/icapps_translations.svg)](https://pub.dartlang.org/packages/icapps_translations)

This repo contains an example how to use this package.

Packages used:
 - flutter_localizations
 - shared_preferences
 - provider
 - kiwi
 - icapps_translations

## Example

<img src="https://github.com/icapps/flutter-icapps-translations/blob/master/assets/example.gif?raw=true" alt="Example" width="300"/>

## Setup

### Add dependency to pubspec

[![pub package](https://img.shields.io/pub/v/icapps_translations.svg)](https://pub.dartlang.org/packages/icapps_translations)
```
dev-dependencies:
  icapps_translations: <latest-version>
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

### Arguments

Arguments are supported as of 0.1.3

You can pass a String or a num to as an argument.

Formatting for String: %1$s
Formatting for num: %1$d

The number in between % and $ indicate the index of the argument. It is possible to place an argument in 1 language first but in another second:

ex (Grammatically incorrect but it makes my point):

```
nl '%1$s, ik woon in %2$s. Wist je dat niet?' => KOEN, ik woon in ANTWERPEN. Wist je dat niet?

fr 'I live in %2$s. You didn't knew that %1$s?" => I live in ANTWERP. You didn't knew that KOEN?
```

### Working on mac?

add this to you .bash_profile

```
fluttertranslations(){
 flutter packages get && flutter packages pub run icapps_translations
}
```

now you can use the icapps translations with a single command.

```
fluttertranslations
```