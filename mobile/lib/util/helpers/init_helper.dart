import 'package:weeb_dev_my_movie_list/network/api_managers/movie_api_manager.dart'; 
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart'; 

class Initializer {
  
  static void initializeManagers(){
    ScreenManager(); 
    MovieAPIManager(); 
  } 

}