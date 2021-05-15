import 'genre.dart';

class Movie{
  
  String title;
  double rating;
  List<Genre> genres;
  String id;
  String description;
  String releaseDate; 
  String posterPath;
  String backdropPath;  


  Movie({
    this.id,
    this.title, 
    this.rating, 
    this.genres,
    this.description, 
    this.releaseDate,
    this.posterPath,
    this.backdropPath
  });

  Movie.fromJson(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    rating = json["vote_average"]?.toDouble();
    description = json["description"];
    releaseDate = json["release_date"];
    posterPath = json["poster_path"];   
    backdropPath = json["backdrop_path"];
    genres = [];
    if(json['genres'] != null){
      json['genres'].forEach((data){
        genres.add(Genre.fromJson(data));
      });
    }
  }
    

}