// ignore: depend_on_referenced_packages
import 'package:cookmate/book/application.dart';
import 'package:cookmate/book/presentation/screens/cookmate/page.dart';
import 'package:flutter/material.dart';

class CookMate extends Application {
  CookMate({super.key});

  @override
  State<CookMate> createState() => _CookmateState();
}

class _CookmateState extends ApplicationState<CookMate> {
  @override
  final routes = {
    CookmateScreen.route,
  };

  @override
  String get initialRoute => CookmateScreen.path;
}
