import 'dart:async';

import 'package:pelis/model/media.dart';
import 'package:pelis/http/httpHandler.dart';
import 'package:http/http.dart' as http;

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

class tvSeries extends MediaProvider{
  
  @override
  Future<List<Media>> fetchMedia() {
    HttpHandler _client = HttpHandler.get();

    return _client.fechTvSeries();
  }
}
