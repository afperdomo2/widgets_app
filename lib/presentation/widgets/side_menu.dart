import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // final hasNotch = MediaQuery.of(context).padding.top > 0;
    final colors = Theme.of(context).colorScheme;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (int index) {
        // final item = appMenuItems[index];
        // context.go(item.routeName);
        setState(() => navDrawerIndex = index);
      },
      children: [
        Text('${navDrawerIndex}'),
        DrawerHeader(
          decoration: BoxDecoration(color: colors.primary),
          child: Center(
            child: Text(
              "Widgets App",
              style: TextStyle(color: colors.onPrimary, fontSize: 24),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text("Main", style: TextStyle(color: colors.primary, fontSize: 14)),
        ),
        ...appMenuItems.sublist(0, 3).map((item) {
          return NavigationDrawerDestination(
            icon: Icon(item.icon, color: colors.primary),
            label: Text(item.title),
          );
        }),
        Divider(color: colors.primary, thickness: 0.5, indent: 16, endIndent: 16),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: Text("Others", style: TextStyle(color: colors.primary, fontSize: 14)),
        ),
        ...appMenuItems.sublist(4).map((item) {
          return NavigationDrawerDestination(
            icon: Icon(item.icon, color: colors.primary),
            label: Text(item.title),
          );
        }),
      ],
    );
  }
}
