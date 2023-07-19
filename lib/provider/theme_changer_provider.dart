import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  final _themeMode = ThemeMode.light;
  ThemeMode get thememode => _themeMode;

  void setTheme(themeMode) {
    notifyListeners();
  }
}
