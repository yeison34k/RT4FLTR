import 'package:pelis/common/imageUtil.dart';
import 'package:pelis/common/mediaProvider.dart';

class Cast {
  int id;
  String name;
  String character;
  String profilePath;
  int mediaId;

  String getImage() => getMediumPictureUrl(profilePath);

  factory Cast(Map jsonMap) {
    return Cast.deserialize(jsonMap);
  }

  Cast.deserialize(Map json)
      : this.id = json["id"],
        this.name = json["name"],
        this.character = json["character"],
        this.profilePath =
            json["profile_path"] ?? "/rLSUjr725ez1cK7SKVxC9udO03Y.jpg";

  Cast.fromDb(Map<String, dynamic> json)
      : this.id = json["id"].toInt(),
        this.name = json["name"],
        this.character = json["character"],
        this.profilePath =
            json["profile_path"] ?? "/rLSUjr725ez1cK7SKVxC9udO03Y.jpg",
        mediaId = json["mediaId"];

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      "id": id,
      "name": name,
      "media_id": mediaId,
      "profile_path": profilePath
    };
  }
}
