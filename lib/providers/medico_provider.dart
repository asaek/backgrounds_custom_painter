import 'package:flutter/material.dart';

class MedicoProvider with ChangeNotifier {
  Color _color1 = Color(0xff526BF6);
  Color get color1 => this._color1;
  set color1(Color valor) {
    this._color1 = valor;
    notifyListeners();
  }

  Color _color2 = Color(0xff67ACF2);
  Color get color2 => this._color2;
  set color2(Color valor) {
    this._color2 = valor;
    notifyListeners();
  }

  Color _cruzColor = Color(0xffFAFAFA);
  Color get cruzColor => this._cruzColor;
  set cruzColor(Color valor) {
    this._cruzColor = valor;
    notifyListeners();
  }

  String _titulo = 'Kyary';
  String get titulo => this._titulo;
  set titulo(String valor) {
    this._titulo = valor;
    notifyListeners();
  }

  String _subTitulo = 'Kyary 2';
  String get subTitulo => this._subTitulo;
  set subTitulo(String valor) {
    this._subTitulo = valor;
    notifyListeners();
  }
}
