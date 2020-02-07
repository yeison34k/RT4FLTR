import 'dart:async';

import 'package:pelis/model/cast.dart';
import 'package:pelis/model/media.dart';
import 'package:pelis/http/httpHandler.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia();

  Future<List<Cast>> fetchCreditsMedia(int mediaId);

}

class Movies extends MediaProvider{
  
  @override
  Future<List<Media>> fetchMedia() {
    HttpHandler _client = HttpHandler.get();
    return _client.fechMovies();
  }

  @override
  Future<List<Cast>> fetchCreditsMedia(int mediaId) {
    HttpHandler _client = HttpHandler.get();
    return _client.fechCastMovies(mediaId);
  }
}

class TvSeries extends MediaProvider{
  
  @override
  Future<List<Media>> fetchMedia() {
    HttpHandler _client = HttpHandler.get();
    return _client.fechTvSeries();
  }

  @override
  Future<List<Cast>> fetchCreditsMedia(int mediaId) {
    HttpHandler _client = HttpHandler.get();
    return _client.fechCastTv(mediaId);
  }
}
enum MediaType { movie, tv}