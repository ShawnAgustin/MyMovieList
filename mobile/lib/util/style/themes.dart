import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';

class Themes {
  static ThemeData _mainTheme = ThemeData(
      accentColor: Colors.blue,
      primaryColor: Colors.black,
      disabledColor: Colors.black45,
      unselectedWidgetColor: Colors.black45,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      cardColor: Colors.white,
      canvasColor: Colors.white,
      textTheme: TextTheme(
          headline6: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: ScreenManager.hp(4)),
          headline1: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: ScreenManager.hp(2)),
          headline2: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: ScreenManager.hp(2.5)),
          subtitle1: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: ScreenManager.hp(2))));

  static ThemeData get mainTheme => _mainTheme;
}
