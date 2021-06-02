import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/models/enums/movie_status.dart';
import 'package:weeb_dev_my_movie_list/models/movie.dart';
import 'package:weeb_dev_my_movie_list/network/api_managers/movie_api_manager.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';
import 'package:weeb_dev_my_movie_list/widgets/rating_dropdown.dart';
import 'package:weeb_dev_my_movie_list/widgets/status_dropdown.dart';

class MovieInfo extends StatelessWidget {
  final Movie movie;
  MovieInfo({this.movie}); 
  @override
  Widget build(BuildContext context) {
    Widget _buildDialogHeader() {
      return Container(
        height: ScreenManager.hp(5),
        alignment: Alignment.centerRight,
        child: CloseButton(
          color: Theme.of(context).buttonColor,
          onPressed: Navigator.of(context).pop,
        ),
      );
    }

  Widget _buildDescription() {
      return Expanded(
        child: Container(
          child: Text(
            movie.description,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      );
    }

    Widget _buildMoviePoster() {
      return Container(
        padding: EdgeInsets.symmetric(vertical: ScreenManager.hp(1), horizontal: ScreenManager.wp(0)),
        width: ScreenManager.wp(30),
        child: CachedNetworkImage(
          imageUrl: MovieAPIManager.getPosterURL(movie.posterPath),
          fit: BoxFit.cover,
          errorWidget: (context, error, stackTrace) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.block,
                    color: Theme.of(context).unselectedWidgetColor,
                    size: ScreenManager.hp(5),
                  ),
                  Text(
                    'No Image Found',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: ScreenManager.hp(1.5)),
                  )
                ],
              ),
            );
          },
        ),
      );
    }

    Widget _buildMovieHeader() {
      return Column(
        children: [
          Container(
            child: Text(
              '${movie.title}',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Container(
            child: Text('${movie.generateGenresString()}'),
          ),
          Container(
              child: Text(
            'IMDB ${movie.rating}',
            style: Theme.of(context).textTheme.subtitle1,
          )),
        ],
      );
    } 

  
    Widget _buildDialogBody() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenManager.wp(5)),
        height: ScreenManager.hp(70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMovieHeader(),
            Container(
                child: Row(
              children: [
                _buildMoviePoster(),
                Container(
                  padding: EdgeInsets.only(left: ScreenManager.wp(2.5)),
                  width: ScreenManager.wp(50),
                  child: Column(
                    children: [
                      StatusDropDown(Status.COMPLETED),
                      SizedBox(
                        height: ScreenManager.hp(2.5),
                      ),
                      RatingDropdown(4)
                    ],
                  ),
                )
              ],
            )),
            _buildDescription()
          ],
        ),
      );
    }


    return Center(
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        elevation: 16,
        color: Theme.of(context).cardColor,
        child: Container(
          width: ScreenManager.wp(90),
          height: ScreenManager.hp(75),
          child: Column(
            children: [
              _buildDialogHeader(), 
              _buildDialogBody()
            ],
          ),
        ),
      ),
    );

    


  }



 




}
