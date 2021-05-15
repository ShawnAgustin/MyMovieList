 class MovieAPIManager{
  
  static MovieAPIManager _instance; 
  static String _movieKey;
  static String _movieBaseURL;

  factory MovieAPIManager(){
    _instance ??= MovieAPIManager._internal();
    _movieKey = '';
    _movieBaseURL  = "https://api.themoviedb.org/3";
    return _instance; 
  }

  MovieAPIManager._internal();

  static MovieAPIManager get instance =>_instance; 
  static String get movieKey => _movieKey;
  static String get movieBaseURL => _movieBaseURL; 
}
 
 