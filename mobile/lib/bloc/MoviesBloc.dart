import 'package:rxdart/rxdart.dart'; 
import 'package:weeb_dev_my_movie_list/models/response/movie_response.dart';
import 'package:weeb_dev_my_movie_list/network/repositories/movie_repository.dart';

class MoviesBloc {
  final MovieRepository _movieRepository = MovieRepository();
  
  final BehaviorSubject<MovieResponse> _movieController = BehaviorSubject<MovieResponse>();
  
  BehaviorSubject<MovieResponse> get movieController => _movieController.stream;

  getMovies() async {
    MovieResponse response = await _movieRepository.getMovies();
    _movieController.sink.add(response);
  }

  dispose() {
    _movieController.close();
  }
 
}
 