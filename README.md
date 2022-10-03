# flutter icapps translations

A dart package to automaticly download translations from the icapps translation tool. The rest of the implementation is done by locale_gen https://pub.dev/packages/locale_gen

[![pub package](https://img.shields.io/pub/v/icapps_translations.svg)](https://pub.dartlang.org/packages/icapps_translations)
[![Build Status](https://app.travis-ci.com/icapps/flutter-icapps-translations.svg?branch=master)](https://app.travis-ci.com/icapps/flutter-icapps-translations)
[![Coverage Status](https://coveralls.io/repos/github/icapps/flutter-icapps-translations/badge.svg?branch=master)](https://coveralls.io/github/icapps/flutter-icapps-translations?branch=master)
[![MIT license](https://img.shields.io/badge/License-MIT-blue.svg)](https://lbesson.mit-license.org/)

## Example

<img src="https://github.com/icapps/flutter-icapps-translations/blob/master/assets/example.gif?raw=true" alt="Example" width="300"/>

## Setup

### Add dependency to pubspec

[![pub package](https://img.shields.io/pub/v/icapps_translations.svg)](https://pub.dartlang.org/packages/icapps_translations)
```yaml
dependencies:
  sprintf: ^6.0.2

dev-dependencies:
  icapps_translations: <latest-version>
```

### Add config to pubspec

Add your locale folder to the assets to make use all your translations are loaded.
```yaml
flutter:
  assets:
    - assets/locale/
```

Add the icapps_translations config to fetch the latest translations
```yaml
icapps_translations:
  api_key: 'enter-your-api-key' #For the new translations tool, this is the bearer token
  project_id: 'optional project id' #To use the new translations tool, enter the project id here
  default_language: 'nl'
  languages: ['en', 'nl']
  locale_assets_path: 'assets/locale/' #This is the location where your json files should be saved.
  assets_path: 'assets/locale/' #This is the location where your json files are located in your flutter app.
  nullsafety: true #Generate nullsafety compatible code. Defaults to false
```

alternatively set an env variable for your api_key and/or project_id

```shell
API_KEY_ICAPPS_TRANSLATIONS
PROJECT_ID_ICAPPS_TRANSLATIONS
```

### Run package with Flutter

```shell
flutter packages pub run icapps_translations
```

### Run package with Dart

```shell
pub run icapps_translations
```

### Migration steps <9.0.0 to >=9.0.0
With version 9.0.0 of local gen you no longer have static access to the translations, instead you can now manually manage the different localization instances. You can for example store a localization instance as a static. This way you can use it largely the same way as before. Example from the example project:

```dart
class LocaleViewModel with ChangeNotifier {
  static final Localization localizationInstance = Localization();
  ...

  Future<void> init(){
    await Localization.load(locale: locale);
    notifyListeners();
  }
```

You can then access this localizationInstance anywhere in the project like:
```dart
LocaleViewModel.localizationInstance.translation1;
LocaleViewModel.localizationInstance.translation2;
LocaleViewModel.localizationInstance.translation3;
```

### Migration steps <7.0.0 to >=7.0.0
With the newest version of locale_gen the context no longer needs to be provided when accessing the translations. This means there are a couple of breaking changes.

The first one is that you can now directly get the translation from the Localization object without having to pass the context, so instead of:

```dart
Localization.of(context).translation;
```

you can now do

```dart
Localization.translation;
```

The second breaking change is how you initialize/change the locale. Before you could do this by changing the localizationDelegate that is passed to the materialApp, but now you just call the load function of the Localization object. So instead of:

```dart
      localeDelegate = LocalizationDelegate(
        newLocale: locale,
        localizationOverrides: customLocalizationOverrides,
      );
```
you now do:

```dart
await Localization.load(
      locale: locale,
      localizationOverrides: customLocalizationOverrides,
    );
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

### Plurals

Since 8.0.0 plurals are supported. To specify a plural, you can use the following syntax in the json file:

```json
{
  "example_plural": {
    "zero": "You have no items",
    "one": "You have %1$d item",
    "two": "You have 2 items, party!",
    "few": "You have a few items, nice!",
    "many": "You have many items, fantastic!",
    "other": "You have %1$d items"
  }
}
```
This will generate functions where you pass the number of items as an argument. The function will then return the correct translation based on the number of items.
The count argument *WILL NOT* be passed as an argument for string interpolation.

Note that the "other" key is always required, the other keys are dependant on the language in question

### Working on mac?

add this to you .bash_profile

```shell
fluttertranslations(){
 flutter packages get && flutter packages pub run icapps_translations
}
```

now you can use the icapps translations with a single command.

```shell
fluttertranslations
```

## Example
This repo contains an example how to use this package.

Packages used:
 - flutter_localizations
 - shared_preferences
 - provider
 - kiwi
 - icapps_translations