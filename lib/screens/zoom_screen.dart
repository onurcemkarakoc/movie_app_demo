import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ZoomScreen extends StatefulWidget {
  final String data;

  const ZoomScreen({Key key, this.data}) : super(key: key);

  @override
  _ZoomScreenState createState() => _ZoomScreenState();
}

class _ZoomScreenState extends State<ZoomScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: zoomScreenBody(),
    );
  }

  zoomScreenBody() {
    var padding = MediaQuery.of(context).padding;
    return Stack(children: [
      PhotoView(
        imageProvider: NetworkImage(
      widget.data,
        ),
      ), Padding(
        padding: EdgeInsets.only(top: padding.top, left: 12.0),
        child: IconButton(
          color: Colors.white,
          onPressed: () {
            backPressed();
          },
          icon: Icon(Icons.keyboard_backspace, size: 36),
        ),
      ),
    ]);
  }

  void backPressed() {Navigator.pop(context);}
}
