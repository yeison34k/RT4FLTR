import 'dart:async';

import 'package:pelis/model/cast.dart';
import 'package:pelis/model/media.dart';
import 'package:pelis/resources/apiProvider.dart';
import 'package:pelis/resources/repository.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia();

  Future<List<Cast>> fetchCreditsMedia(int mediaId);

}

class Movies extends MediaProvider{
  
  @override
  Future<List<Media>> fetchMedia() {
    ApiProvider _client = ApiProvider.get();
    return _client.fechMovies();
  }

  @override
  Future<List<Cast>> fetchCreditsMedia(int mediaId) {
    Repository _client = Repository.get();
    return _client.fechCast(mediaId);
  }
}

class TvSeries extends MediaProvider{
  
  @override
  Future<List<Media>> fetchMedia() {
    ApiProvider _client = ApiProvider.get();
    return _client.fechTvSeries();
  }

  @override
  Future<List<Cast>> fetchCreditsMedia(int mediaId) {
    Repository _client = Repository.get();
    return _client.fechCastTv(mediaId);
  }
}
enum MediaType { movie, tv}