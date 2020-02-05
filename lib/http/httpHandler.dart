import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pelis/common/constants.dart';
import 'package:pelis/model/media.dart';

class HttpHandler {

  static final _httpHandler = new HttpHandler();

  final String _baseUrl = "api.themoviedb.org";
  final String _languaje = "es-ES";

  static HttpHandler get() {
    return _httpHandler;
  }

  Future<dynamic> getUrl(Uri url) async {
    http.Response response = await http.get(url);
    return json.decode(response.body);
  }

  Future<List<Media>> fechMovies() {
    var uri = new Uri.https(_baseUrl, "3/movie/popular",
        {'api_key': API_KEY, 'page': "1", 'languaje': _languaje});

    return getUrl(uri).then(
        ((data) => data["results"].map<Media>((item) => new Media(item)).toList()));
  }

  Future<List<Media>> fechTvSeries() {
    var uri = new Uri.https(_baseUrl, "3/tv/popular",
        {'api_key': API_KEY, 'page': "1", 'languaje': _languaje});

    return getUrl(uri).then(
        ((data) => data["results"].map<Media>((item) => new Media(item)).toList()));
  }

}
