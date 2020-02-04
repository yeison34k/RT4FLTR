import 'package:flutter/material.dart';
import 'package:pelis/http/httpHandler.dart';
import 'package:pelis/model/media.dart';
import 'package:pelis/widget/mediaListItem.dart';

class MediaList extends StatefulWidget {
  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> with SingleTickerProviderStateMixin {
  List<Media> _mediaList = new List();
  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadMovies() async {
    var movies  = await HttpHandler().fechMovies();

    setState(() {
      _mediaList.addAll(movies);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: _mediaList.length,
          itemBuilder: (BuildContext context, int i) {
            return new Column(
              children: <Widget>[
                MediaListItem(_mediaList[i])
              ],
            );
          }
      ),
    );
  }
}


