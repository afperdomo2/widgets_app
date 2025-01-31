import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
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
              subtitle: Text(item.route),
              leading: Icon(item.icon, color: colors.primary),
              trailing: Icon(Icons.chevron_right, color: colors.primary),
              onTap: () {
                Navigator.pushNamed(context, item.route);
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (context) => const ButtonsScreen()),
                // );
              },
            );
          },
        ));
  }
}
