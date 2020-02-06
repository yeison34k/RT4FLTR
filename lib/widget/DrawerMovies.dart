import 'package:flutter/material.dart';
import 'package:pelis/common/mediaProvider.dart';
import 'package:pelis/main.dart';

// ignore: must_be_immutable
class DrawerMovies extends StatefulWidget {
  BuildContext parentContext;

  DrawerMovies(BuildContext parentContext) {
    this.parentContext = parentContext;
  }

  @override
  _DrawerMoviesState createState() => _DrawerMoviesState();
}

class _DrawerMoviesState extends State<DrawerMovies> {
  MediaType mediaType;

  _changeMediaType(MediaType media) {
    setState(() => mediaType = media);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Text(
          'Movies',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
      ListTile(
          selected: mediaType == MediaType.movie,
          leading: Icon(Icons.movie),
          title: Text('Movies'),
          onTap: () {
            _changeMediaType(MediaType.movie);
            Navigator.push(
                widget.parentContext,
                MaterialPageRoute(
                    maintainState: false,
                    builder: (widget) =>
                        MyHomePage(title: "Movies", media: mediaType)));
          }),
      ListTile(
          selected: mediaType == MediaType.tv,
          leading: Icon(Icons.tv),
          title: Text('Tv Series'),
          onTap: () {
            _changeMediaType(MediaType.tv);
            Navigator.push(
                widget.parentContext,
                MaterialPageRoute(
                    maintainState: false,
                    builder: (widget) =>
                        MyHomePage(title: "Tv Series", media: mediaType)));
          }),
      ListTile(
        leading: Icon(Icons.close),
        title: Text('Terminate'),
        onTap: () {
          Navigator.pop(widget.parentContext);
        },
      )
    ]));
  }
}