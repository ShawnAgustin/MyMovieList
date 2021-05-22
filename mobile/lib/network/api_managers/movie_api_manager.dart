 import 'package:weeb_dev_my_movie_list/util/helpers/environment_manager.dart';

class MovieAPIManager{
  
  static MovieAPIManager _instance; 
  static String _movieKey;
  static String _movieBaseURL;
  static String _moviePosterBaseURL;

  factory MovieAPIManager(){
    _instance ??= MovieAPIManager._internal();
    _movieKey = EnvironmentManager.movieAPIKey();
    _movieBaseURL  = "https://api.themoviedb.org/3";
    _moviePosterBaseURL = "https://image.tmdb.org/t/p/w1280";
    return _instance; 
  }

  MovieAPIManager._internal();

  static MovieAPIManager get instance =>_instance; 
  static String get movieKey => _movieKey;
  static String get movieBaseURL => _movieBaseURL; 

  static String getPosterURL(String posterPath) => "$_moviePosterBaseURL$posterPath";
}
 
  