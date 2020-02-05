import 'package:flutter/material.dart';
import 'package:pelis/common/mediaProvider.dart';

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
  final MediaProvider mediaProvider = new Movies();

  final MediaProvider tvProvider = new TvSeries();

  MediaType mediaType = MediaType.movie;

  _changeMediaType(MediaType media) {
    if (media != mediaType) {
      setState(() {
        mediaType = media;
      });
    }
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
          }),
      ListTile(
          selected: mediaType == MediaType.tv,
          leading: Icon(Icons.tv),
          title: Text('Tv Series'),
          onTap: () {
            _changeMediaType(MediaType.tv);
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
