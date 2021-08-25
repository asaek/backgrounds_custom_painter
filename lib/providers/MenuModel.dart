import 'package:flutter/material.dart';

class MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index) {
    this._itemSeleccionado = index;
    notifyListeners();
  }

  bool _mostrar = true;
  bool get mostrar => this._mostrar;
  set mostrar(bool valor) {
    this._mostrar = valor;
    notifyListeners();
  }

  Color _backgroundColor = Colors.blueGrey;
  Color get backgroundColor => this._backgroundColor;
  set backgroundColor(Color valor) {
    this._backgroundColor = valor;
    notifyListeners();
  }

  Color _activeColor = Colors.cyan;
  Color get activeColor => this._activeColor;
  set activeColor(Color valor) {
    this._activeColor = valor;
    notifyListeners();
  }

  Color _inactivdeColor = Colors.grey;
  Color get inactivdeColor => this._inactivdeColor;
  set inactivdeColor(Color valor) {
    this._inactivdeColor = valor;
    notifyListeners();
  }
}
