import 'package:icapps_translations_example/repository/locale_repository.dart';
import 'package:icapps_translations_example/viewmodel/locale/locale_viewmodel.dart';
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';

abstract class Injector {
  @Register.singleton(LocaleRepository)
  void registerCommonDependencies();

  @Register.factory(LocaleViewModel)
  void registerViewModelFactories();
}

void setupDependencyTree() {
  _$Injector()
    ..registerCommonDependencies()
    ..registerViewModelFactories();
}
