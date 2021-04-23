import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_demo/constants/api_constants.dart';
import 'package:movie_app_demo/models/popular_movie_response.dart';

import '../detail_screen.dart';
import 'movie_list_item.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Results> results;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: homeScreen(),);
  }

  homeScreen() {
    var padding = MediaQuery.of(context).padding;
    getResults();
    if (results == null) return Center(child: CircularProgressIndicator());
    else if(results.isEmpty) return Center(child: Text("Lütfen daha sonra tekrar deneyiniz"));


    return RefreshIndicator(
      onRefresh: () => getResults(),
      child: Padding(
        padding: EdgeInsets.only(top: padding.top),
        child: buildGridView(results),
      ),
    );
  }

  Widget buildGridView(List<Results> results) {
    return Column(
      children: [
        Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  childAspectRatio: 0.75),
              itemBuilder: (context, index) => MovieListItem(
                results: results[index],
              ),
              itemCount: results.length,
              padding: EdgeInsets.all(4),
            )),
      ],
    );
  }

  getResults() async {
    try {
      var future = Dio().get((ApiConstants.BASE_URL + "movie/popular"),
          queryParameters: queryParameters());
      var response = await future;
      PopularMovieResponse pmr = PopularMovieResponse.fromJson(response.data);
      setState(() {
        results = pmr.results;
      });
    } catch (e) {
      setState(() {
        results = List.empty();
      });
      print("error");
    }
  }

  queryParameters() {
    Map<String, dynamic> map = {};
    map["api_key"] = ApiConstants.API_KEY;
    return map;
  }
}
