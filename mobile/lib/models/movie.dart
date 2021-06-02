import 'genre.dart';

class Movie {
  String title;
  double rating;
  List<Genre> genres;
  String id;
  String description;
  String releaseDate;
  String posterPath;
  String backdropPath;

  Movie(
      {this.id,
      this.title,
      this.rating,
      this.genres,
      this.description,
      this.releaseDate,
      this.posterPath,
      this.backdropPath});

  Movie.fromJson(Map<String, dynamic> json) {
    id = json["id"].toString();
    title = json["title"];
    rating = json["vote_average"]?.toDouble();
    description = json["overview"];
    releaseDate = json["release_date"];
    posterPath = json["poster_path"];
    backdropPath = json["backdrop_path"];
    genres = [];
    if (json['genres'] != null) {
      print(json['genres']);
      json['genres'].forEach((data) {
        genres.add(Genre.fromJson(data));
      });
    }
  }

  String generateGenresString() {
    String genreString = '';
    for (Genre g in this.genres) {
      genreString = "$genreString,${g.name}";
    }
    if (genreString.isNotEmpty) {
      genreString.replaceFirst(',', '');
    }
    print('!!${this.genres.length} : $genreString');
    return genreString;
  }
}
