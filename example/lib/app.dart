import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:icapps_translations_example/screen/home_screen.dart';
import 'package:icapps_translations_example/util/locale/localization_delegate.dart';
import 'package:icapps_translations_example/viewmodel/locale/locale_viewmodel.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocaleViewModel>(
      child: Consumer<LocaleViewModel>(
        builder: (context, value, child) => MaterialApp(
          title: 'icapps translations',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          localizationsDelegates: [
            value.localeDelegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: value.localeDelegate.activeLocale,
          supportedLocales: LocalizationDelegate.supportedLocales,
          home: HomeScreen(),
        ),
      ),
      builder: (context) => kiwi.Container().resolve()..init(),
    );
  }
}
