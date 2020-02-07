import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pelis/common/mediaProvider.dart';
import 'package:pelis/model/media.dart';
import 'dart:ui' as ui;

import 'package:pelis/widget/castScroller.dart';

class MediaDetails extends StatelessWidget {
  final Media media;
  final MediaType mediaType;

  MediaDetails(this.media, this.mediaType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(media.getPosterLarge(), fit: BoxFit.cover),
          BackdropFilter(
              filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: Colors.black.withOpacity(0.5))),
          SingleChildScrollView(
              child: Container(
            margin: EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 390.0,
                    height: 390.0,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: NetworkImage(media.getPosterLarge())),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 20.0,
                            offset: Offset(0.0, 10.0))
                      ]),
                ),
                SizedBox(height: 30.0),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          media.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 22,
                              fontFamily: "Arvo"),
                        ),
                      ),
                      Text('${media.voteAverage.toString()}/10',
                          style: TextStyle(
                              color: Colors.white30,
                              fontSize: 20,
                              fontFamily: "Arvo"))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        media.overview,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 7,
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontFamily: "Arvo"),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                CastScroller(media.id, mediaType)
              ],
            ),
          )),
        ],
      ),
    );
  }
}
