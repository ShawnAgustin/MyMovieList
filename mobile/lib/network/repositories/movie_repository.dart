import 'package:dio/dio.dart';
import 'package:weeb_dev_my_movie_list/models/response/movie_response.dart';
import 'package:weeb_dev_my_movie_list/network/api_managers/movie_api_manager.dart';

class MovieRepository{
  static String _apiKey = MovieAPIManager.movieKey;
  static String _baseURL = MovieAPIManager.movieBaseURL;
  final Dio _jojo = Dio();
  String _getMoviesUrl = '$_baseURL/discover/movie';     

  Future<MovieResponse> getMovies() async {
    var params = {'api_key': _apiKey, 'language': 'en-US', 'page': 1}; 

    try {
      Response response = await _jojo.get(_getMoviesUrl, queryParameters: params);
      return MovieResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return MovieResponse.withError("$error");
    } 
  }

}