import 'package:flutter/material.dart';
import 'package:movie_app_demo/constants/api_constants.dart';
import 'package:movie_app_demo/models/popular_movie_response.dart';
import 'package:movie_app_demo/screens/zoom_screen.dart';

class DetailScreen extends StatefulWidget {
  final Results results;

  const DetailScreen({Key key, this.results}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: detailScreenBody(),
    );
  }

  detailScreenBody() {
    var size = MediaQuery.of(context).size;
    var padding = MediaQuery.of(context).padding;
    return SingleChildScrollView(
      child: Stack(children: [
        GestureDetector(
          onTap: () => toZoomScreen(widget.results.backdropPath),
          child: Container(
              width: size.width,
              height: size.width * 0.5,
              child: Image.network(
                ApiConstants.IMAGE_BASE_URL +
                    ApiConstants.IMAGE_W780 +
                    widget.results.backdropPath,
                fit: BoxFit.cover,
              )),
        ),
        Padding(
          padding: EdgeInsets.only(top: padding.top, left: 12.0),
          child: IconButton(
            color: Colors.white,
            onPressed: () {
              backPressed();
            },
            icon: Icon(Icons.keyboard_backspace, size: 36),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(top: size.width * 0.3, left: 12.0, right: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.width * 0.4,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => toZoomScreen(widget.results.posterPath),
                      child: Container(
                          width: size.width * 0.3,
                          height: size.width * 0.4,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      ApiConstants.IMAGE_BASE_URL +
                                          ApiConstants.IMAGE_W780 +
                                          widget.results.posterPath)))),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              height: size.height * 0.1,
                            ),
                          ),
                          Container(
                            alignment: Alignment.topLeft,
                            height: size.height * 0.1,
                            margin: EdgeInsets.only(left: size.width * 0.025),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.results.title,
                                  overflow: TextOverflow.ellipsis,
                                  strutStyle: StrutStyle(fontSize: 12.0),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                        color: Colors.yellowAccent,
                                      ),
                                ),
                                Text(
                                  widget.results.originalTitle,
                                  overflow: TextOverflow.ellipsis,
                                  strutStyle: StrutStyle(fontSize: 8.0),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                        color: Colors.indigo,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "Started On: ${widget.results.releaseDate}",
                                  overflow: TextOverflow.ellipsis,
                                  strutStyle: StrutStyle(fontSize: 8.0),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                        color: Colors.white38,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent ipsum orci, condimentum eu placerat in, mattis in orci. Curabitur viverra purus nibh, id convallis dolor luctus vel. Aenean tristique sagittis aliquet. Curabitur cursus nunc at aliquam luctus. Aliquam nibh nisl, finibus nec ultrices sit amet, efficitur vel est. Nulla tempus elit elit, quis aliquet tortor lobortis ac. Praesent eget metus in odio mattis eleifend ac id dolor. Duis luctus vulputate ligula sit amet faucibus. Fusce nec lorem finibus, posuere mauris ac, dictum est. Nulla egestas purus dui, gravida varius nisl feugiat nec. Nunc vestibulum tellus non consectetur hendrerit. Ut in blandit erat. Pellentesque suscipit nunc nisl, non auctor nulla mattis at.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 6, bottom: 6),
                child: Divider(
                  color: Colors.white38,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellowAccent,
                  ),
                  Text(
                    " ${widget.results.voteAverage} ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 10.0,),
                  Icon(
                    Icons.language,
                    color: Colors.deepPurple,
                  ),
                  Text(
                    " ${widget.results.originalLanguage.toUpperCase()} ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.white),
                  ),
                  SizedBox(width: 10.0,),
                  Icon(
                    Icons.people,
                    color: Colors.pink,
                  ),
                  Text(
                    " ${widget.results.popularity} ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 6, bottom: 6),
                child: Divider(
                  color: Colors.white38,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  toZoomScreen(String url) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ZoomScreen(
            data: ApiConstants.IMAGE_BASE_URL +
                ApiConstants.IMAGE_W780 +
                url,
          ),
        ));
  }

  backPressed() {
    Navigator.pop(context);
  }
}
