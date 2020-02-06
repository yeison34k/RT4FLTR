import 'package:pelis/common/generesUtil.dart';
import 'package:pelis/common/imageUtil.dart';
import 'package:pelis/common/mediaProvider.dart';

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

  int getReleaseDate() {
    if( releaseDate.isNotEmpty )
      return DateTime.parse(releaseDate).year;
    
    return 0;
  }

  factory Media(Map jsonMap, MediaType mediaType) {
    return Media.deserialize(jsonMap, mediaType);
  }

  Media.deserialize(Map json, MediaType mediaType)
      : this.id = json["id"].toInt(),
        this.voteAverage = json["vote_average"].toDouble(),
        this.title = json["title"] ?? json["name"] ?? "",
        this.posterPath = json["poster_path"] ?? "",
        this.backDropPath = json["backdrop_path"] ?? "",
        this.overview = json["overview"] ?? "",
        this.releaseDate = json[mediaType == MediaType.movie ? "release_date" : "first_air_date"],
        this.genereIds = json["genre_ids"] ?? "";
}
