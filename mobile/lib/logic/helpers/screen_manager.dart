import 'dart:ui'; 
import 'package:flutter/cupertino.dart';

class ScreenManager{
  
  static ScreenManager _instance;
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static Size _screenSize = mediaQuery.size; 
  static bool _isLandscape = mediaQuery.orientation == Orientation.landscape; 

  factory ScreenManager(){
    _instance ??= ScreenManager._internal();
    return _instance; 
  }

  ScreenManager._internal();

  static ScreenManager get instance =>_instance;

  static double wp(percentage) => (percentage * _screenSize.width) / 100;
  
  static double hp(percentage) =>  (percentage * _screenSize.height) / 100;  

  static getScreenWidth() => _screenSize.width; 

  static getScreenHeight() => _screenSize.height; 

  static bool isLandscape() => _isLandscape;
}
 
 