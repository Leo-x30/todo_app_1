import 'package:flutter/material.dart';

class Appconfigprovider extends ChangeNotifier{
  String applanguage='en';
  ThemeMode apptheme=ThemeMode.light;
  void changelanguage(String newlanguage){
    if (applanguage == newlanguage){
      return;
    }
    applanguage=newlanguage;
    notifyListeners();
  }


  void changetheme(ThemeMode newMode){
    if(apptheme == newMode){
      return ;
    }
    apptheme= newMode;
    notifyListeners();
  }
}