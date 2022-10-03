import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icapps_translations_example/viewmodel/locale/locale_viewmodel.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('icapps translations'),
        backgroundColor: Colors.black45,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: const Text('System Language (Not translated)'),
              onPressed: Provider.of<LocaleViewModel>(context)
                  .onSwitchToSystemLanguage,
            ),
            MaterialButton(
              child: const Text('English (Not translated)'),
              onPressed:
                  Provider.of<LocaleViewModel>(context).onSwitchToEnglish,
            ),
            MaterialButton(
              child: const Text('Nederlands (Not translated)'),
              onPressed: Provider.of<LocaleViewModel>(context).onSwitchToDutch,
            ),
            const SizedBox(height: 22),
            Text(LocaleViewModel.localizationInstance.test),
            Text(LocaleViewModel.localizationInstance.testArg1('string')),
            Text(LocaleViewModel.localizationInstance.testArg2(1)),
            Text(LocaleViewModel.localizationInstance.testArg3('string', 1)),
            Text(LocaleViewModel.localizationInstance.testArg4('string', 1)),
            Text(LocaleViewModel.localizationInstance
                .testNonPositional('string', 1)),
            Text(LocaleViewModel.localizationInstance.testPlural(4, 4)),
            Text(LocaleViewModel.localizationInstance.testPlural(1, 1)),
          ],
        ),
      ),
    );
  }
}
