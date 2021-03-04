import 'package:flutter/material.dart';
import 'package:icapps_translations_example/util/locale/localization.dart';
import 'package:icapps_translations_example/viewmodel/locale/locale_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('icapps translations'),
        backgroundColor: Colors.black45,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('System Language (Not translated)'),
              onPressed: Provider.of<LocaleViewModel>(context)
                  .onSwitchToSystemLanguage,
            ),
            TextButton(
              child: const Text('English (Not translated)'),
              onPressed:
                  Provider.of<LocaleViewModel>(context).onSwitchToEnglish,
            ),
            TextButton(
              child: const Text('Nederlands (Not translated)'),
              onPressed: Provider.of<LocaleViewModel>(context).onSwitchToDutch,
            ),
            Container(height: 32),
            Text(Localization.of(context).test),
            Text(Localization.of(context).testArg1('string')),
            Text(Localization.of(context).testArg2(1.0)),
            Text(Localization.of(context).testArg3('string', 1.0)),
            Text(Localization.of(context).testArg4('string', 1.0)),
          ],
        ),
      ),
    );
  }
}
