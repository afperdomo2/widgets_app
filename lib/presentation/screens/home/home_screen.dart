import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>(); // Contiene la llave del Scaffold
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Widgets App"),
      ),
      body: ListView.builder(
        // physics: const BouncingScrollPhysics(), Disable the bounce effect
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final item = appMenuItems[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.subtitle),
            leading: Icon(item.icon, color: colors.primary),
            trailing: Icon(Icons.chevron_right, color: colors.primary),
            onTap: () => context.pushNamed(item.routeName),
            // onTap: () => context.push(item.route),
          );
        },
      ),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}
