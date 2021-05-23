import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/bloc/expansion_list_bloc.dart';
import 'package:weeb_dev_my_movie_list/network/repositories/movie_repository.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/environment_manager.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';
import 'package:weeb_dev_my_movie_list/widgets/movie_watchlist_expansion_panel.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage();
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ExpansionListBloc _expansionListBloc;
  List<bool> isExpandeds = [
    false,
    false,
    false,
  ];

  @override
  void initState() {
    super.initState();
    _expansionListBloc = ExpansionListBloc(List.filled(4, false));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: ScreenManager.wp(5)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: ScreenManager.hp(1)),
            alignment: Alignment.centerLeft,
            child: Text(
              'My Profile',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          StreamBuilder<List<bool>>(
            stream: _expansionListBloc.expandedPanelsController,
            initialData: List.filled(4, false),
            builder: (context, snapshot) {
              if (!(snapshot?.hasData ?? false)) {
                return Container();
              }
              return ExpansionPanelList(
                expandedHeaderPadding: EdgeInsets.zero,
                expansionCallback: _expansionListBloc.updatePanel,
                elevation: 1,
                children: [
                  MovieWatchlistExpansionPanelBuilder(context).buildByFuture(
                      'Completed',
                      MovieRepository().getPopularMovies(),
                      snapshot.data[0]),
                  MovieWatchlistExpansionPanelBuilder(context).buildByFuture(
                      'Planned',
                      MovieRepository().searchMovies('Avengers'),
                      snapshot.data[1]),
                  MovieWatchlistExpansionPanelBuilder(context).buildByFuture(
                      'Private',
                      MovieRepository()
                          .searchMovies(EnvironmentManager.getSpecial()),
                      snapshot.data[2]),
                ],
              );
            },
          ),
        ],
      ),
    ));
  }
}
