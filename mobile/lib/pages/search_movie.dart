import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/bloc/MoviesBloc.dart';
import 'package:weeb_dev_my_movie_list/models/response/movie_response.dart';

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
  }

  @override
  Widget build(BuildContext context) { 
    _moviesBloc.getMovies();
    return Container(
       color: Colors.red,
       child: StreamBuilder<MovieResponse>(
         stream: _moviesBloc.movieController.stream,
         builder: (context, snapshot){
           if(snapshot.hasData){
             print(snapshot.data.movies);
             return Container();
           }
           return Container();
         },
       )
    );
  }
}