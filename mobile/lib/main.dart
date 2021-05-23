import 'package:flutter/material.dart'; 
import 'package:weeb_dev_my_movie_list/pages/home_page.dart';
import 'package:weeb_dev_my_movie_list/util/helpers/init_helper.dart'; 
import 'package:weeb_dev_my_movie_list/util/style/themes.dart'; 

void main() {
  runApp(MyMovieListApp());
}

class MyMovieListApp extends StatefulWidget {
  MyMovieListApp();

  @override
  _MyMovieListAppState createState() => _MyMovieListAppState();
}

class _MyMovieListAppState extends State<MyMovieListApp> {

  @override
  void initState() { 
    super.initState();
    Initializer.initializeManagers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      theme: Themes.mainTheme,
      home: HomePage()
    );
  }
}

 