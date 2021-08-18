import 'package:flutter/material.dart';

class SliderModer with ChangeNotifier {
  double _currentPage = 0;
  int _cantidadPuntos = 0;

  Color? _colorPrimario;
  Color? _colorSecundario;

  double _dotActivo = 0;
  double _dotDesactivado = 0;

  double get dotActivo => this._dotActivo;
  set dotActivo(double dotActivoParametro) {
    this._dotActivo = dotActivoParametro;
  }

  double get dotDesactivado => this._dotDesactivado;
  set dotDesactivado(double dotDesactivadoParametro) {
    this._dotDesactivado = dotDesactivadoParametro;
  }

  Color get colorPrimario => this._colorPrimario!;

  set colorPrimario(Color colorPrimario1) {
    this._colorPrimario = colorPrimario1;
    // notifyListeners();
  }

  Color get colorSecundario => this._colorSecundario!;

  set colorSecundario(Color colorSecundario1) {
    this._colorSecundario = colorSecundario1;
    // notifyListeners();
  }

  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  int get cantidadPuntos => this._cantidadPuntos;

  set cantidadPuntos(int cantidadPuntos) {
    this._cantidadPuntos = cantidadPuntos;
    // notifyListeners();
  }
}
