import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeb_dev_my_movie_list/bloc/movies_bloc.dart'; 
import 'package:weeb_dev_my_movie_list/models/movie.dart';
import 'package:weeb_dev_my_movie_list/network/api_managers/movie_api_manager.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard(this.movie);

  @override
  Widget build(BuildContext context) { 
    MoviesBloc _movieBloc = BlocProvider.of<MoviesBloc>(context);
    return InkWell(
      onTap: () {
        _movieBloc.dispatchMovieDialog(context, movie);
      },
      child: Container(
        width: ScreenManager.wp(45),
        padding: EdgeInsets.symmetric(horizontal: ScreenManager.wp(2.5)),
        margin: EdgeInsets.symmetric(vertical: ScreenManager.hp(1)),
        child: Column(
          children: [
            Container(
                height: ScreenManager.hp(30),
                child: CachedNetworkImage(
                  imageUrl: MovieAPIManager.getPosterURL(movie.posterPath), 
                  fit: BoxFit.cover,
                  errorWidget: (context, obj, stackTrace) =>
                      _buildNoImage(context))),
            Container(
                padding: EdgeInsets.only(
                  top: ScreenManager.hp(1),
                  bottom: ScreenManager.hp(0.5),
                ),
                width: ScreenManager.wp(40),
                child: Text(
                  movie.title ?? '',
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.headline1,
                )),
            Container(
                width: ScreenManager.wp(40),
                child: Text(
                  '${movie.rating}',
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildNoImage(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.block,
            color: Theme.of(context).unselectedWidgetColor,
            size: ScreenManager.hp(10),
          ),
          Text(
            'No Image Found',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
