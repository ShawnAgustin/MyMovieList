import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/models/movie.dart';
import 'package:weeb_dev_my_movie_list/network/api_managers/movie_api_manager.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';

class MovieWatchlistItem extends StatefulWidget {
  final Movie movie;
  const MovieWatchlistItem(this.movie);

  @override
  _MovieWatchlistItemState createState() => _MovieWatchlistItemState();
}

class _MovieWatchlistItemState extends State<MovieWatchlistItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            bottom: ScreenManager.hp(1),
            left: ScreenManager.wp(2.5),
            right: ScreenManager.wp(2.5)),
        child: Column(
          children: [
            Divider(),
            InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenManager.hp(1),
                        horizontal: ScreenManager.wp(1.25)),
                    width: ScreenManager.wp(20),
                    child: CachedNetworkImage(
                      imageUrl: MovieAPIManager.getPosterURL(widget.movie.posterPath),
                      fit: BoxFit.cover,
                      errorWidget: (context, error, stackTrace) {
                        return _buildNoImage(context);
                      },
                    ),
                  ),
                  Container(  
                    width: ScreenManager.wp(65),
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenManager.hp(1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(  
                          padding: EdgeInsets.only(
                            left: ScreenManager.wp(1.25),
                            right: ScreenManager.wp(1.25),
                          ),
                          width: ScreenManager.wp(35),
                          child: Text(
                            '${widget.movie.title}',
                            textAlign: TextAlign.left,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis, 
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Container(  
                          width: ScreenManager.wp(25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildScoreText(
                                  context, 'My Score', '${widget.movie.rating}'), 
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildScoreText(
      BuildContext context, String scoreTitle, String scoreValue) {
    return Container( 
      child: AutoSizeText.rich(
        TextSpan(text: '$scoreTitle: ', children: [
          TextSpan(
            text: '$scoreValue',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ]),
        maxLines: 1,
        textAlign: TextAlign.right,
        minFontSize: 1,
        style: Theme.of(context).textTheme.headline1,
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
            size: ScreenManager.hp(5),
          ),
          Text(
            'No Image Found',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontSize: ScreenManager.hp(1.5)
            ),
          )
        ],
      ),
    );
  }
}
