import 'package:flutter/material.dart';
import 'package:test1/Home/app_colors.dart';

class Mytheme {
  static final ThemeData lighttheme= ThemeData(
    primaryColor: Appcolors.primarycolor,
    scaffoldBackgroundColor: Appcolors.backgroundlightcolor,
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolors.primarycolor,
      elevation: 0,
    )
    ,textTheme:TextTheme(
    bodyLarge: TextStyle(fontWeight: FontWeight.bold,
    fontSize: 22,
     color: Appcolors.whitecolor
    )
  ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Appcolors.primarycolor,
      selectedIconTheme: IconThemeData(size: 28),
      showUnselectedLabels: false
    ),
  );
  static final ThemeData darktheme= ThemeData(
      primaryColor: Appcolors.primarycolor,
      scaffoldBackgroundColor: Appcolors.backgrounddarkcolor,
      appBarTheme: AppBarTheme(
        backgroundColor: Appcolors.primarycolor,
        elevation: 0,
      )
      ,textTheme:TextTheme(
      bodyLarge: TextStyle(fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Appcolors.blackcolor
      )
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Appcolors.primarycolor,
      selectedIconTheme: IconThemeData(size: 28),
      showUnselectedLabels: false
    ),

  );

}