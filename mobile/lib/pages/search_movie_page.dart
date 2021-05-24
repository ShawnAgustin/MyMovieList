import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 
import 'package:weeb_dev_my_movie_list/bloc/movies_bloc/movies_bloc.dart';
import 'package:weeb_dev_my_movie_list/models/movie.dart';
import 'package:weeb_dev_my_movie_list/models/response/movie_response.dart'; 
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';
import 'package:weeb_dev_my_movie_list/widgets/movie_cards.dart';
import 'package:weeb_dev_my_movie_list/widgets/movie_search_bar.dart';

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
  void dispose() { 
    _moviesBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { 
    return BlocProvider<MoviesBloc>(
      create: (context) => _moviesBloc ,
      child: SingleChildScrollView(
        child: Container( 
          child: Column(
            children: [
              MovieSearchBar(),
              _buildBody()        
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildBody(){
    return Container( 
      padding: EdgeInsets.symmetric(
        horizontal: ScreenManager.wp(5), 
      ),
      child: StreamBuilder<MovieResponse>(
        stream: _moviesBloc.movieController.stream,
        builder: (context, snapshot){   
          if(snapshot.hasData){
              if(snapshot.data.error.isNotEmpty){ 
                return _buildErrorMessage(snapshot.data.error);               } 
              if(snapshot.data.movies.isEmpty){ 
                return _buildEmptySearch(); 
              }  
              return _buildMovieCards(snapshot.data.movies); 
          }
          return Container(); // TODO: ADD empty state
        },
      )
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
  Widget _buildErrorWidget(IconData icon, String message){
    return Container( 
      height: ScreenManager.hp(72.5), 
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: ScreenManager.hp(2.5)),
            child: Icon(icon,
              color: Theme.of(context).unselectedWidgetColor,
              size: ScreenManager.wp(25),
            ),
          ), 
          Text("$message",          
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
          )
        ],
      )
    );
  }
  Widget _buildErrorMessage(String errorMsg){ 
    return _buildErrorWidget(
      Icons.error_outline,
      'Error: $errorMsg');
  }

  Widget _buildEmptySearch(){
    return _buildErrorWidget(
      Icons.search_off_rounded,
      'No results found.');
  }
}