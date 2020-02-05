import 'dart:async';

import 'package:pelis/model/media.dart';
import 'package:pelis/http/httpHandler.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia();
}

class Movies extends MediaProvider{
  
  @override
  Future<List<Media>> fetchMedia() {
    HttpHandler _client = HttpHandler.get();

    return _client.fechMovies();
  }
}

class TvSeries extends MediaProvider{
  
  @override
  Future<List<Media>> fetchMedia() {
    HttpHandler _client = HttpHandler.get();

    return _client.fechTvSeries();
  }
}
enum MediaType { movie, tv}