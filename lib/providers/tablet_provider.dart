import 'package:flutter/material.dart';
import 'package:backgrounds_custom_painter/screens/screens.dart';

class TabletPorivder with ChangeNotifier {
  Widget _rutaSliderSeleccionada = SlideShowScreen2();
  Widget get rutaSliderSeleccionada => this._rutaSliderSeleccionada;
  set rutaSliderSeleccionada(Widget dato) {
    this._rutaSliderSeleccionada = dato;
    notifyListeners();
  }
}
