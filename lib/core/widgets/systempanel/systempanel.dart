import 'package:cookmate/book/application.dart';
import 'package:cookmate/core/design/theme_colors.dart';
import 'package:cookmate/core/design/theme_icons.dart';
import 'package:cookmate/core/lib/platform/platform.dart';
import 'package:cookmate/core/version.g.dart';
import 'package:cookmate/core/widgets/hover_icon_button/widget.dart';
import 'package:flutter/material.dart';

class RuntimeWidget extends StatelessWidget {
  const RuntimeWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _hoverIconButton(
                ThemeIcons.reload,
                ThemeIcons.reload,
                "Restart App",
                () {
                  Application.restartApp(context);
                },
              ),
            ],
          ),
          _fragment(platformDescription),
          _miniFragment(buildDate.toIso8601String().substring(0, 19)),
        ],
      );

  Widget _hoverIconButton(IconData brand, IconData hover, String tip, VoidCallback onPressed) => Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: HoverIconButton(
          icon: brand,
          hoverIcon: hover,
          tooltip: tip,
          size: 20,
          color: themeGrey1Color,
          hoverColor: themeSignalColor,
          onPressed: onPressed,
        ),
      );

  Widget _fragment(String msg) => Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: Text(msg, style: const TextStyle(color: themeGrey2Color)),
      );

  Widget _miniFragment(String msg) => Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: Text(msg, style: const TextStyle(color: themeGrey2Color, fontSize: 12)),
      );
}
