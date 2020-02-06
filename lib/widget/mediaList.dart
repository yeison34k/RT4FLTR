import 'package:flutter/material.dart';
import 'package:pelis/common/mediaProvider.dart';
import 'package:pelis/http/httpHandler.dart';
import 'package:pelis/model/media.dart';
import 'package:pelis/widget/mediaListItem.dart';

class MediaList extends StatefulWidget {
  final MediaType media;
  final String type;

  MediaList(this.media, {Key key, this.type}): super(key: key);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _mediaList = new List();

  @override
  void initState() {
    loadMovies();
    super.initState();
  }
  @override
  void didUpdateWidget(MediaList oldWidget) {
    if(oldWidget.media != widget.media) {
      _mediaList = new List();
      loadMovies();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void loadMovies() async {
    MediaType media = widget.media;

    var movieOrTv;
    if (MediaType.movie == media) {
      movieOrTv = await HttpHandler().fechMovies(type: widget.type);
    } else {
      movieOrTv = await HttpHandler().fechTvSeries(type: widget.type);
    }
    
    setState(() {
      _mediaList.addAll(movieOrTv);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: _mediaList.length,
          itemBuilder: (BuildContext context, int i) {
            return new Column(
              children: <Widget>[MediaListItem(_mediaList[i])],
            );
          }),
    );
  }
}
