# Changelog
## [12.0.0] - 2025-05-28
- Version bump to locale_gen [12.4.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v12.4.0)

## [11.0.0] - 2023-06-05
- Version bump to locale_gen [12.0.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v12.0.0)

## [10.0.0] - 2023-01-16
BREAKING CHANGE!!
- After some time of using the new locale_gen package. It made our lifes harder than before. For now we reverted the .of(context) removal
- singleton implementation Other changes like sprintf, plurals and dependency updates are still in place.

## [9.0.0] - 2022-10-03
### Breaking
- Version bump to locale_gen [9.0.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v9.0.0)
- Translations can no longer be accessed from static methods on the Localization class. Instead you now need to manually manage the different localization instances. Migration steps are described in the readme.

## [8.0.0] - 2022-09-26
### Breaking
- Version bump to locale_gen [8.0.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v8.0.0)
- Arguments are now formatted using the [sprintf](https://pub.dev/packages/sprintf) package. This means %d now refers to integers only. Use %f to format doubles, you can also use some format specifiers, eg: (%.2f will show 2 decimals)
- This means that the sprintf package must be added to the pubspec.yaml (at least ^6.0.2)

### Added
- Support for plurals had been added, see the readme on how to use them

### Updated
- Dependencies

## [7.0.0] - 2022-09-23
### Breaking
- Removed the need of passing a context to get translations. Migration steps are described in the readme.

## [6.0.0] - 2022-02-01
### Updated
- Version bump to locale_gen [6.0.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v5.0.0)

## [5.2.0] - 2022-01-10
### Added
- Adding project_id to the pubspec.yaml file will use the new translations tool

## [5.2.1] - 2022-02-01
### Updated
- Version bump to locale_gen [4.1.2](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v4.1.2)

## [5.2.0] - 2021-12-17
### Updated
- Added support for the new translation tool
  project_id: 'project id' #To use the new translations tool, enter the project id here

## [5.1.1] - 2021-12-17
### Updated
- Version bump to locale_gen [4.1.1](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v4.1.1)

## [5.1.0] - 2021-12-16
### Updated
- Version bump to locale_gen [4.1.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v4.1.0)

## [5.0.0] - 2021-11-12
### Updated
- Version bump to locale_gen [4.0.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v4.0.0)

## [4.7.0] - 2021-11-02
### Updated
- Version bump to locale_gen [3.7.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v3.7.0)

## [4.6.0] - 2021-10-12
### Updated
- Version bump to locale_gen [3.6.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v3.6.0)
  (Update translations at runtime is now available)

## [4.5.0] - 2021-10-06
### Updated
- Version bump to locale_gen [3.5.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v3.5.0)

## [4.4.1] - 2021-05-07
### Updated
- Version bump to locale_gen [3.4.1](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v3.4.1)

## [4.4.0] - 2021-05-06
### Updated
- Version bump to locale_gen [3.4.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v3.4.0)
- Version bump dependencies

## [4.3.0] - 2021-04-07
### Updated
- Version bump to locale_gen [3.3.0](https://github.com/vanlooverenkoen/locale_gen/releases/tag/v3.3.0)

## [4.2.1] - 2021-03-31
### Updated
- Version bump to locale_gen 3.2.1

## [4.2.0] - 2021-03-30
### Updated
- Version bump to locale_gen 3.2.0

## [4.1.0] - 2021-03-26
### Added
-#30 Support for skipping a locale at runtime. example: only use dutch in alpha but not in beta & production (locale_gen)
- Version bump dependencies

## [4.0.0] - 2021-03-04
### Added
- Option to generate null safety compatible code & support for Flutter 2.0 & dart 2.12
### Removed
- Updated to locale_gen 3.0.0 -> nullsafe flag is removed. nullsafe is used by default

## [3.1.0] - 2021-02-09
### Added
- Option to generate null safety compatible code

## [3.0.5] - 2020-10-06
### Fixed
-#24: error when using locale_asset_path in combination with the icapps_translations package (fixed in locale_gen)

## [3.0.4] - 2020-10-03
### Fixed
-Version locale_gen

## [3.0.3] - 2020-10-03
### Fixed
-Version bump packages

## [3.0.2] - 2020-10-03
### Fixed
-Android embedding v2

## [3.0.1] - 2020-10-03
### Updated
-Documentation updated
-locale_gen version bump to 2.0.1
 
## [3.0.0] - 2020-10-03
### REFACTOR
-Full rewrite. Uses locale_gen as a base packge so the logic is only stored in locale_gen. (locale_gen is the offline alternative)
 
## [2.2.0] - 2020-06-16
### Added
-Support for strict mode 

## [2.1.0] - 2020-06-16
### Added
-Support for a multi module architecture 
 
## [2.0.0] - 2020-02-10
### Breaking
-isInTest => showLocalizationKeys
 Behaviour is still the same.

## [1.0.1] - 2020-02-18
### Removed
- Removed ⚠ before and after keys.
### Added
- Support for `\n`

## [1.0.0] - 2020-02-10
### Added
-Added support for getting the Localization.keys
-Added support for getting a translation by key and args

## [0.2.1] - 2019-10-21
### Fixed
-Formatting

## [0.2.0] - 2019-10-21
### Added
-Support for test

### Removed
-Unneeded logs

## [0.1.9] - 2019-08-19
### Added
-Errorhandling with an easy to understand message

## [0.1.8] - 2019-06-20
### Fixed
-Fixed documentation for arguments %1$s or %1$d
-Fixed dartfmt

## [0.1.7] - 2019-06-20
### Fixed
-Fixed dartfmt

## [0.1.6] - 2019-06-20
### Fixed
-Fixed formatting for the localization_delegate.dart file

## [0.1.5] - 2019-06-20
### Added
-Added a new template project for the translations

### Fixed
-Fixed a crash when no translations were added.

## [0.1.4] - 2019-06-13
### Fixed
-dart formatting

## [0.1.3] - 2019-06-13
### Added
-Added support for arguments (%1$s = string and %1$d =number are supported). Formatting is not supported.

### Fixed
-README.md

-example README.md

## [0.1.2] - 2019-06-13
### Added
-dart format

## [0.1.1] - 2019-06-13
### Added
-Fixed a pub.dev linting warning for better health

## [0.1.0] - 2019-06-13
### Added
-Updated README.md & dart format

## [0.0.3] - 2019-06-12
### Added
-Updated the description

## [0.0.2] - 2019-06-12
### Added
-Updated README.md

## [0.0.1] - 2019-06-12
### Added
-Initial release
