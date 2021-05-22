 
import 'package:flutter_config/flutter_config.dart';

class EnvironmentManager{
  
  static EnvironmentManager _instance; 

  factory EnvironmentManager()   { 
    _instance ??= EnvironmentManager._internal();
    return _instance; 
  }

  EnvironmentManager._internal();

  static String movieAPIKey() => FlutterConfig.get('MOVIE_API_KEY');
 
}
 
 