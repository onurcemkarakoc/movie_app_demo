import 'package:flutter/material.dart';
import 'package:movie_app_demo/screens/homescreen/home_screen.dart';

void main()=> runApp(Main());

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MovieAppDemo",
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomeScreen()),
    );
  }
}
