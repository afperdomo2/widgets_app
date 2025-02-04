import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String route;
  final String routeName;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.route,
    required this.routeName,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: "Botones",
    subtitle: "Widgets de botones",
    route: "/buttons",
    routeName: "buttons_screen",
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: "Tarjetas",
    subtitle: "Un contenedor estilizado",
    route: "/cards",
    routeName: "cards_screen",
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: "Indicadores de progreso",
    subtitle: "Generales y controlados",
    route: "/progress",
    routeName: "progress_screen",
    icon: Icons.hourglass_empty,
  ),
];
