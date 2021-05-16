import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';

class Themes{

  static ThemeData _mainTheme = ThemeData(
    accentColor: Colors.blue,
    primaryColor: Colors.black,
    disabledColor: Colors.black45,
    unselectedWidgetColor: Colors.black45, 
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: ScreenManager.hp(2)
      ),
      subtitle1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: ScreenManager.hp(2)
      )
    )
  );

  static ThemeData get mainTheme => _mainTheme;
}