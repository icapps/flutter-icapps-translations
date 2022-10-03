import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:icapps_translations_example/screen/home_screen.dart';
import 'package:icapps_translations_example/viewmodel/locale/locale_viewmodel.dart';
import 'package:provider/provider.dart';

import 'repository/locale_repository.dart';

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
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: LocaleViewModel.localizationInstance.locale,
          supportedLocales:
              LocaleViewModel.localizationInstance.supportedLocales,
          home: HomeScreen(),
        ),
      ),
      create: (_) => LocaleViewModel(LocaleRepository())..init(),
    );
  }
}
