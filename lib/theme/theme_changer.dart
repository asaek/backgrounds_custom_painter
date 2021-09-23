import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _darkTheme = false;
  bool _customTheme = false;

  ThemeData _currentTheme = ThemeData.light();

  bool get darkTheme => this._darkTheme;
  bool get customTheme => this._customTheme;

  ThemeData get currenTheme => this._currentTheme;

  ThemeChanger(int theme) {
    switch (theme) {
      case 1: //    Light
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = ThemeData.light().copyWith(
          accentColor: Colors.pink,
        );
        break;
      case 2: //    Dark
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = ThemeData.dark();
        break;
      case 3: //    Dark
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
    }
  }

  set darkTheme(bool dato) {
    _customTheme = false;
    _darkTheme = dato;

    if (dato) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light().copyWith(
        accentColor: Colors.pink,
      );
    }
    notifyListeners();
  }

  set customTheme(bool dato) {
    _customTheme = dato;
    _darkTheme = false;

    if (dato) {
      _currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Color(0xffffc8af),
        primaryColor: Color(0xff979185), //  color del appbar
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.pink),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.purpleAccent,
        ),
        // appTheme.textTheme.bodyText1!.color,
      );
    } else {
      _currentTheme = ThemeData.light();
    }
    notifyListeners();
  }

//   set currenTheme(ThemeData dato) {
//     _currentTheme = dato;
//     notifyListeners();
//   }
}
