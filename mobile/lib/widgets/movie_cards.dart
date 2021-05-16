import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/models/movie.dart';
import 'package:weeb_dev_my_movie_list/network/api_managers/movie_api_manager.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenManager.wp(45),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenManager.wp(2.5)),
      margin: EdgeInsets.symmetric(
        vertical: ScreenManager.hp(1)),
      child: Column(
        children: [
          Container(
            height: ScreenManager.hp(30),
            child: Image.network(
              MovieAPIManager.getPosterURL(movie.posterPath),
              fit: BoxFit.cover,
            )
          ),
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
            child: Text('${movie.rating}',
              softWrap: true,
              textAlign: TextAlign.left,  
              style: Theme.of(context).textTheme.subtitle1,
            )),
        ],
      ),
    );
  }
} 