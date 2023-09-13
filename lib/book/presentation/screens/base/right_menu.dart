import 'package:cookmate/book/presentation/screens/base/base_menu.dart';
import 'package:cookmate/book/presentation/screens/base/menu_item.dart';
import 'package:cookmate/core/design/theme_colors.dart';
import 'package:cookmate/core/design/theme_icons.dart';
import 'package:flutter/material.dart';

class RightMenu extends BaseMenu {
  const RightMenu({
    required super.refresh,
    super.logout = true,
    super.key,
  });

  @override
  List<Widget> menuItems(BuildContext context) => [
        ListTile(
          title: const Text("docscan"),
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: themeGrey4Color,
            child: ThemeIcons.logo2(color: nord4SnowStorm),
          ),
        ),
        const SizedBox(height: 10),
        const Divider(thickness: 1, height: 2),
        const SizedBox(height: 10),
      ];

  @override
  List<Widget> accountItems(BuildContext context) => <Widget>[];

  Widget menuItem(MenuItem item) => Builder(builder: (context) {
        return ListTile(
          title: Text(item.title),
          leading: item.icon,
          onTap: () {
            item.action(context);
            if (item.closeDrawer) {
              Scaffold.of(context).closeEndDrawer();
            }
          },
        );
      });
}
