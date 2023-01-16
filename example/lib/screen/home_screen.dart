import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icapps_translations_example/util/locale/localization.dart';
import 'package:icapps_translations_example/viewmodel/locale/locale_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localization = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('icapps translations'),
        backgroundColor: Colors.black45,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: const Text('System Language (Not translated)'),
              onPressed: Provider.of<LocaleViewModel>(context).onSwitchToSystemLanguage,
            ),
            MaterialButton(
              child: const Text('English (Not translated)'),
              onPressed: Provider.of<LocaleViewModel>(context).onSwitchToEnglish,
            ),
            MaterialButton(
              child: const Text('Nederlands (Not translated)'),
              onPressed: Provider.of<LocaleViewModel>(context).onSwitchToDutch,
            ),
            const SizedBox(height: 22),
            Text(localization.test),
            Text(localization.testArg1('string')),
            Text(localization.testArg2(1)),
            Text(localization.testArg3('string', 1)),
            Text(localization.testArg4('string', 1)),
            Text(localization.testNonPositional('string', 1)),
            Text(localization.testPlural(4, 4)),
            Text(localization.testPlural(1, 1)),
          ],
        ),
      ),
    );
  }
}
