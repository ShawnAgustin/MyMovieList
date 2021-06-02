import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weeb_dev_my_movie_list/bloc/movies_bloc.dart'; 
import 'package:weeb_dev_my_movie_list/pages/profile_page.dart';
import 'package:weeb_dev_my_movie_list/pages/search_movie_page.dart';  

class HomePage extends StatelessWidget {
  HomePage(); 
  
  final List<Tab> _tabs = [
    Tab(icon: Icon(Icons.search)),
    Tab(icon: Icon(Icons.account_circle)),  
  ];

  @override
  Widget build(BuildContext context) {
    return  BlocProvider<MoviesBloc>(
      create: (context) => MoviesBloc(),
      child: SafeArea(
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: TabBar( 
              indicatorColor: Theme.of(context).accentColor,
              unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
              labelColor: Theme.of(context).accentColor, 
              tabs: _tabs
            ),
            body: TabBarView(
              children: [
                SearchMoviePage(),
                ProfilePage(), 
              ],
            ),
          ),
        ),
      ),
    );
  }
 
}