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
    title: "Riverpod Counter",
    subtitle: "Manejo del estado con Riverpod",
    route: "/counter",
    routeName: "counter_screen",
    icon: Icons.add,
  ),
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
  MenuItem(
    title: "Snackbars",
    subtitle: "Mensajes emergentes",
    route: "/snackbars",
    routeName: "snackbars_screen",
    icon: Icons.notifications,
  ),
  MenuItem(
    title: "Animated Container",
    subtitle: "Contenedor animado",
    route: "/animated",
    routeName: "animated_screen",
    icon: Icons.animation,
  ),
  MenuItem(
    title: "UI Controls + Tiles",
    subtitle: "Switches, radio buttons y checkboxes",
    route: "/ui-controls",
    routeName: "ui_controls_screen",
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: "Tutorial",
    subtitle: "Tutorial de la app",
    route: "/tutorial",
    routeName: "app_tutorial_screen",
    icon: Icons.school,
  ),
  MenuItem(
    title: "Infinite Scroll",
    subtitle: "Listas infinitas y refresh",
    route: "/infinite-scroll",
    routeName: "infinite_scroll_screen",
    icon: Icons.vertical_align_bottom,
  ),
  MenuItem(
    title: "Theme Changer",
    subtitle: "Cambia el tema de la app",
    route: "/theme-changer",
    routeName: "theme_changer_screen",
    icon: Icons.palette,
  ),
];
