import 'package:flutter/material.dart';

class AppTheme {
  //
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    accentColor: Color(0xfff5f8fd),
    primaryColorLight: Colors.grey[300],
    primaryColorDark: Colors.blue[50],
    buttonColor: Colors.blue,
    accentColorBrightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Color(0xfff5f8fd),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      subtitle1: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        color: Colors.black87,
      ),
      headline1: TextStyle(
        color: Colors.black87,
      ),
      headline6: TextStyle(color: Colors.black87),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue, foregroundColor: Colors.white),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    accentColor: Colors.grey[900],
    primaryColorLight: Colors.grey[900],
    primaryColorDark: Colors.grey[700],
    buttonColor: Colors.black,
    accentColorBrightness: Brightness.light,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.black45,
    ),
    cardTheme: CardTheme(
      color: Color(0xfff5f8fd),
    ),
    iconTheme: IconThemeData(
      color: Colors.white70,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      subtitle1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      subtitle2: TextStyle(
        color: Colors.white70,
      ),
      headline1: TextStyle(
        color: Colors.white,
      ),
      headline6: TextStyle(
        color: Colors.white,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
    ),
  );
}
