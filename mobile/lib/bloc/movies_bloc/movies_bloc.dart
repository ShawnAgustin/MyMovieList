import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart'; 
import 'package:weeb_dev_my_movie_list/models/response/movie_response.dart';
import 'package:weeb_dev_my_movie_list/network/repositories/movie_repository.dart';

class MoviesBloc extends BlocBase{
  final MovieRepository _movieRepository = MovieRepository();
  
  final BehaviorSubject<MovieResponse> _movieController = 
    BehaviorSubject<MovieResponse>();

  MoviesBloc() : super(null) {
    getMovies();
  }
 
  
  BehaviorSubject<MovieResponse> get movieController => 
    _movieController.stream;

  getMovies() async {
    MovieResponse response = 
      await _movieRepository.getPopularMovies();
    _movieController.sink.add(response);
  }

  searchMovies(String query) async { 
    MovieResponse response = 
    await _movieRepository.searchMovies(query); 
    _movieController.sink.add(response);
  }

  dispose() {
    _movieController.close();
  }
 
  onSearchEditCompleteEvent(String query){
    if(query.isNotEmpty){ 
      searchMovies(query.trim());
    }else{ 
      getMovies();
    }
  }
 
}
 