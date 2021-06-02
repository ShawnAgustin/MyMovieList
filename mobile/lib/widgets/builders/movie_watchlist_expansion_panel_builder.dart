import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/models/movie.dart';
import 'package:weeb_dev_my_movie_list/models/response/movie_response.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';
import 'package:weeb_dev_my_movie_list/widgets/movie_watchlist_item.dart';
 

class MovieWatchlistExpansionPanelBuilder {
  final BuildContext context;
  MovieWatchlistExpansionPanelBuilder(this.context);

  ExpansionPanel buildByFuture(
      String title, Future<MovieResponse> moviesRequest, bool isExpanded) {
    return ExpansionPanel(
      canTapOnHeader: true,
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
            vertical: ScreenManager.hp(1),
            horizontal: ScreenManager.wp(3.75)),
          child: Text(title, style: Theme.of(context).textTheme.headline1),
        );
      },
      body: Container(
        child: FutureBuilder<MovieResponse>(
          future: moviesRequest,
          builder: (context, snapshot) {
            return Column(
              children: 
                _buildWatchListItems(
                  (snapshot?.hasData ?? false)
                    ? (snapshot.data?.error?.isNotEmpty ?? true)
                      ? []
                      : snapshot.data.movies
                    : []  
                ) 
            );
          },
        ),
      ),
      isExpanded: isExpanded);
  }

  ExpansionPanel build(
    String title,
    List<Movie> movies,
    bool isExpanded,
  ) {
    return ExpansionPanel(
        canTapOnHeader: true,
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                vertical: ScreenManager.hp(1),
                horizontal: ScreenManager.wp(2.5)),
            child: Text(title, style: Theme.of(context).textTheme.headline1),
          );
        },
        body: Container(
          child: Column(children: _buildWatchListItems(movies)),
        ),
        isExpanded: isExpanded);
  }

  List<Widget> _buildWatchListItems(List<Movie> movies) { 
    if (movies?.isEmpty ?? true) {
      return [
        Container(
          padding: EdgeInsets.symmetric(
            vertical: ScreenManager.hp(3),
          ),
          alignment: Alignment.center,
          child: AutoSizeText('This list is empty',
            maxLines: 1,
            minFontSize: 1,
            style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: Theme.of(context).disabledColor)))
      ];
    }
    List<Widget> watchListItems = [];
    movies.forEach((movie) {
      watchListItems.add(MovieWatchlistItem(movie));
    });
    return watchListItems;
  }
}
