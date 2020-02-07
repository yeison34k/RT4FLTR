import 'package:pelis/common/imageUtil.dart';

class Cast {
  String name;
  String character;
  String profilePath;

  String getImage() => getMediumPictureUrl(profilePath);

  factory Cast(Map jsonMap) {
    return Cast.deserialize(jsonMap);
  }

  Cast.deserialize(Map json)
      : this.name = json["name"],
        this.character = json["character"],
        this.profilePath = json["profile_path"] ?? "/rLSUjr725ez1cK7SKVxC9udO03Y.jpg";
}
