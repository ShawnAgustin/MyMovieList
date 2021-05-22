import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:weeb_dev_my_movie_list/network/api_managers/movie_api_manager.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/environment_manager.dart'; 
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart'; 

class Initializer {
  
  static void initializeManagers() async {  
    ScreenManager(); 
    MovieAPIManager();
    EnvironmentManager(); 
  } 

  static Future<void> initializeEnvironmentConfig() async {
    WidgetsFlutterBinding.ensureInitialized();  
    await FlutterConfig.loadEnvVariables();
  }

}