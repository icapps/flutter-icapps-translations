import 'package:flutter/material.dart';
import 'package:icapps_translations_example/app.dart';
import 'package:icapps_translations_example/di/injector.dart' as kiwi;

Future<void> main() async {
  kiwi.setupDependencyTree();
  runApp(MyApp());
}
