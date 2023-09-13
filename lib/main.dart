import 'package:cookmate/book/cookmate.dart';
import 'package:cookmate/book/presentation/screens/error/error.dart' as error;
import 'package:cookmate/core/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initServiceLocator();

  ErrorWidget.builder = (FlutterErrorDetails details) => error.ErrorScaffold(
        error: details.exceptionAsString(),
        stackTrace: details.stack,
        reload: () => {},
      );

  runApp(CookMate());
}
