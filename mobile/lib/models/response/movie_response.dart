import 'package:weeb_dev_my_movie_list/models/movie.dart';

class MovieResponse{
  List<Movie> movies;
  String error;

  MovieResponse(this.movies, this.error);

  MovieResponse.fromJson(Map<String, dynamic> json){
    movies = [];
    if (json["results"] != null){
      json["results"].forEach((data){
        movies.add(Movie.fromJson(data));
      });
    }
    error = "";
  }

  MovieResponse.withError(String errorMsg){
    movies = [];
    error = errorMsg;
  }
 
}