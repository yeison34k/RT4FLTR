import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pelis/model/media.dart';


// ignore: must_be_immutable
class MediaListItem extends StatelessWidget {
  Media media;

  MediaListItem(Media media) {
    this.media = media;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              FadeInImage.assetNetwork(
                image: media.getPoster(),
                placeholder: media.getPoster(),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
                fadeInDuration: Duration(milliseconds: 40),
              ),
              Positioned(
                left: 0.0,
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.grey[900].withOpacity(0.5)),
                  constraints: BoxConstraints.expand(height: 55.00),
                ),
              ),
              Positioned(
                left: 10.0,
                bottom: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(media.title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: 320.0,
                      padding: EdgeInsets.only(top: 4.0),
                      child: Text(
                        media.getGenere(),
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  right: 5.0,
                  bottom: 10.0,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(media.voteAverage.toString(), style: TextStyle(color: Colors.white),),
                          Icon(Icons.star, color: Colors.white,  size: 16.0,)
                        ],
                      )
                    ],
                  ))
            ],
          ),
        )
      ],
    ));
  }
}
