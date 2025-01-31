import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String route;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.route,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Botones",
    route: "Widgets de botones",
    link: "/buttons",
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: "Tarjetas",
    route: "Widgets de tarjetas",
    link: "/cards",
    icon: Icons.credit_card,
  ),
];
