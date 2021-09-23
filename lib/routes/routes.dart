import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:backgrounds_custom_painter/screens/screens.dart';

class _Route {
  final IconData icon;
  final String title;
  final Widget page;

  _Route(
    this.icon,
    this.title,
    this.page,
  );
}

final pageRoutes = <_Route>[
  _Route(
    FontAwesomeIcons.slideshare,
    'SlideShow',
    SlideShowScreen2(),
  ),
  _Route(
    FontAwesomeIcons.ambulance,
    'Emergencia',
    EmergencyScreen(
        iconData: FontAwesomeIcons.ambulance,
        subtitulo: 'Esto es algo',
        titulo: 'Algo es esto'),
  ),
  _Route(
    FontAwesomeIcons.heading,
    'Encabezados',
    HeadersPage(),
  ),
  _Route(
    FontAwesomeIcons.peopleCarry,
    'Cuadro Animado',
    CuadradoAnimadoScreen(),
  ),
  _Route(
    FontAwesomeIcons.circleNotch,
    'Barra Progreso',
    GraficasCircularesScreen(),
  ),
  _Route(
    FontAwesomeIcons.pinterest,
    'Pinteres',
    PinteresPage(),
  ),
  _Route(
    FontAwesomeIcons.mobile,
    'Slivers',
    SliverListPage(),
  ),
];
