import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un ejemplo de tarjetas en Flutter',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title:'Progress Indicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title:'Snackbars dialogos',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title:'Animated Container',
    subTitle: 'Contenedor animado',
    link: '/animated_container',
    icon: Icons.animation,
  ),
  MenuItem(
    title:'UI Controls',
    subTitle: 'Controles de usuario',
    link: '/ui_controls',
    icon: Icons.settings,
  ),
  MenuItem(
    title: 'Introduccion a la app',
    subTitle: 'Pequeño tutorial de la app',
    link: '/tutorial',
    icon: Icons.school,
  ),
  MenuItem(
    title: 'Infinite scroll y Pull', 
    subTitle: 'Scroll infinito en Flutter y Pull to refresh',
    link: '/infinitescroll',
    icon: Icons.list_alt
  ),
  MenuItem(
    title: 'Counter', 
    subTitle: 'Contador de ejemplo con riverpod',
    link: '/counter',
    icon: Icons.add_circle_outline
  )
];
