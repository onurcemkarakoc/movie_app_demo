import 'package:flutter/material.dart';
import 'package:movie_app_demo/constants/api_constants.dart';
import 'package:movie_app_demo/models/popular_movie_response.dart';

import '../detail_screen.dart';

class MovieListItem extends StatefulWidget {
  final Results results;

  const MovieListItem({Key key, this.results}) : super(key: key);

  @override
  _MovieListItemState createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {toDetailPage(widget.results)},
      child: Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(ApiConstants.IMAGE_BASE_URL +
                      ApiConstants.IMAGE_W780 +
                      widget.results.posterPath)))),
    );
  }

  toDetailPage(Results results) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailScreen(
            results: results,
          ),
        ));
  }
}
