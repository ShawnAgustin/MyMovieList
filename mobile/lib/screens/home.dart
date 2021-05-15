import 'package:flutter/material.dart';
import 'package:weeb_dev_my_movie_list/screens/profile.dart';
import 'package:weeb_dev_my_movie_list/screens/search_movie.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/screen_manager.dart';

class Home extends StatefulWidget {
  Home();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> { 
  
  final List<Tab> _tabs = [
    Tab(icon: Icon(Icons.search,),),
    Tab(icon: Icon(Icons.account_circle,),),  
  ];
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
              SearchMovieScreen(),
              ProfileScreen(), 
            ],
          ),
        ),
      ),
    );
  }
}