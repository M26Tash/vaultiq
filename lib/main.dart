import 'package:flutter/material.dart';
import 'package:vaultiq/src/common/di/injector.dart';
import 'package:vaultiq/src/features/app/pages/app.dart';

void main() {
  injectDependencies();

  runApp(const App());
}
