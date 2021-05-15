import 'package:flutter/material.dart';

class Themes{

  static ThemeData _mainTheme = ThemeData(
    accentColor: Colors.blue,
    primaryColor: Colors.black,
    disabledColor: Colors.black45,
    unselectedWidgetColor: Colors.black45 
  );

  static ThemeData get mainTheme => _mainTheme;
}