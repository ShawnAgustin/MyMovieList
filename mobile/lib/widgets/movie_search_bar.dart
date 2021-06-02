import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeb_dev_my_movie_list/bloc/movies_bloc.dart'; 
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';

class MovieSearchBar extends StatefulWidget {
  MovieSearchBar();

  @override
  _MovieSearchBarState createState() => _MovieSearchBarState();
}

class _MovieSearchBarState extends State<MovieSearchBar> {
  TextEditingController _searchController;
  @override
  void initState() { 
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() { 
    _searchController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MoviesBloc _moviesBloc = BlocProvider.of<MoviesBloc>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenManager.wp(7.5)
      ),
      margin: EdgeInsets.symmetric(
        vertical: ScreenManager.hp(2.5)
      ),
      child: TextField( 
        onEditingComplete: (){ 
          _moviesBloc.onSearchEditCompleteEvent(_searchController?.text ?? '');
        },
        onSubmitted: (text){ 
          _moviesBloc.onSearchEditCompleteEvent(text ?? '');
        },
        controller: _searchController,
        decoration: InputDecoration(
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100.0),
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.search), 
            color: Theme.of(context).accentColor ,
            onPressed: (){ 
              _moviesBloc.onSearchEditCompleteEvent(_searchController?.text ?? '');
            })
        ),
      ),
    );
  }
}