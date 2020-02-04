import 'package:pelis/common/generesUtil.dart';
import 'package:pelis/common/imageUtil.dart';

class Media {
  int id;
  double voteAverage;
  String title;
  String posterPath;
  String backDropPath;
  String overview;
  String releaseDate;
  List<dynamic> genereIds;

  String getPoster() => getMediumPictureUrl(posterPath);

  String getPosterLarge() => getLargePictureUrl(posterPath);

  String getGenere() => getGeneresValues(genereIds);

  factory Media(Map jsonMap) {
    return Media.deserialize(jsonMap);
  }

  Media.deserialize(Map json)
      : this.id = json["id"].toInt(),
        this.voteAverage = json["vote_average"].toDouble(),
        this.title = json["title"],
        this.posterPath = json["poster_path"] ?? "",
        this.backDropPath = json["backdrop_path"] ?? "",
        this.overview = json["overview"],
        this.releaseDate = json["releaseDate"],
        this.genereIds = json["genre_ids"];
}
