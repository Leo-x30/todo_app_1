import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appconfigprovider extends ChangeNotifier {
  String applanguage = 'en';
  ThemeMode apptheme = ThemeMode.light;

  Appconfigprovider() {
    _loadPreferences();
  }

  void changelanguage(String newlanguage) async {
    if (applanguage == newlanguage) {
      return;
    }
    applanguage = newlanguage;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('language', newlanguage);
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

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? themeMode = prefs.getString('themeMode');
    if (themeMode != null) {
      apptheme = themeMode == 'light' ? ThemeMode.light : ThemeMode.dark;
    }
    String? language = prefs.getString('language');
    if (language != null) {
      applanguage = language;
    }
    notifyListeners();
  }
}
