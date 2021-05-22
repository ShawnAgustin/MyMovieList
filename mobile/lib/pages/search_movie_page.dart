import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/bloc/MoviesBloc.dart';
import 'package:weeb_dev_my_movie_list/models/movie.dart';
import 'package:weeb_dev_my_movie_list/models/response/movie_response.dart'; 
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';
import 'package:weeb_dev_my_movie_list/widgets/movie_cards.dart';

class SearchMoviePage extends StatefulWidget {
  SearchMoviePage({Key key}) : super(key: key);

  @override
  _SearchMoviePageState createState() => _SearchMoviePageState();
}

class _SearchMoviePageState extends State<SearchMoviePage> {
  MoviesBloc _moviesBloc;

  @override
  void initState() { 
    super.initState();
    _moviesBloc = MoviesBloc();
    _moviesBloc.getMovies();
  }
  
  @override
  void dispose() { 
    _moviesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    return SingleChildScrollView(
      child: Container( 
        padding: EdgeInsets.symmetric(
          horizontal: ScreenManager.wp(5),
          vertical: ScreenManager.hp(2.5)
        ),
        child: StreamBuilder<MovieResponse>(
          stream: _moviesBloc.movieController.stream,
          builder: (context, snapshot){
            if(snapshot.hasData){
                if(snapshot.data.error.isNotEmpty)
                  return Container();
                if(snapshot.data.movies.isEmpty)
                  return Container(); 
                return _buildMovieCards(snapshot.data.movies); 
            }
            return Container();
          },
        )
      ),
    );
  }

  Widget _buildMovieCards(List<Movie> movies){
    List<Widget> movieCards = [];
    movies.forEach((element) { 
      movieCards.add(MovieCard(element));
    });

    return Wrap(
      children: movieCards,
    );
  }
}