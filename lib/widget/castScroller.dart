import 'package:flutter/material.dart';
import 'package:pelis/common/mediaProvider.dart';
import 'package:pelis/http/httpHandler.dart';
import 'package:pelis/model/cast.dart';

class CastScroller extends StatefulWidget {
  final int idMedia;
  final MediaType media;

  CastScroller(this.idMedia, this.media);

  @override
  _CastScrollerState createState() => _CastScrollerState();
}

class _CastScrollerState extends State<CastScroller> {
  List<Cast> _castList = new List();

  void loadCast() async {
    MediaType media = widget.media;

    var movieOrTv;
    if (MediaType.movie == media) {
      movieOrTv = await HttpHandler().fechCastMovies(widget.idMedia);
    } else {
      movieOrTv = await HttpHandler().fechCastTv(widget.idMedia);
    }

    setState(() {
      _castList.addAll(movieOrTv);
    });
  }

  @override
  void initState() {
    loadCast();
    super.initState();
  }

  Widget builderCast(BuildContext context, int i) {
    var cast = _castList[i];
    return Padding(
      padding: EdgeInsets.only(right: 16.0),
      child: Column(children: <Widget>[
        CircleAvatar(
          radius: 40.0,
          backgroundImage: NetworkImage(cast.getImage()),
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox.fromSize(
        size: Size.fromHeight(180.0),
        child: ListView.builder(
            itemCount: _castList.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(top: 12, left: 20.0),
            itemBuilder: builderCast),
      )
    ]);
  }
}
