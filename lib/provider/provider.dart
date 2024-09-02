import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appconfigprovider extends ChangeNotifier {
  String applanguage = 'en';
  ThemeMode apptheme = ThemeMode.light;

  Appconfigprovider() {
    _loadThemeMode();
  }

  void changelanguage(String newlanguage) {
    if (applanguage == newlanguage) {
      return;
    }
    applanguage = newlanguage;
    notifyListeners();
  }

  void changetheme(ThemeMode newMode) async {
    if (apptheme == newMode) {
      return;
    }
    apptheme = newMode;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('themeMode', newMode == ThemeMode.light ? 'light' : 'dark');
  }

  void _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeMode = prefs.getString('themeMode');
    if (themeMode != null) {
      apptheme = themeMode == 'light' ? ThemeMode.light : ThemeMode.dark;
      notifyListeners();
    }
  }
}
