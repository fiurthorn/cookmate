import 'package:cookmate/core/design/theme_colors.dart';
import 'package:cookmate/core/lib/logger.dart';
import 'package:cookmate/core/widgets/responsive.dart';
import 'package:flutter/material.dart';

String showSnackBarFailure(BuildContext context, String hint, String? message, Object? error,
    {StackTrace? stackTrace}) {
  final msg = message ?? error?.toString() ?? "Unknown error";

  Log.high("snackBar Failure on hint:'$hint' ${message ?? ''}", error: error, stackTrace: stackTrace);

  WidgetsBinding.instance.addPostFrameCallback((_) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: ResponsiveWidthPadding(Text(msg)),
      backgroundColor: themeSignalColor,
      duration: const Duration(seconds: 5),
    ));
  });

  return msg;
}
