final String _imageMediumUrl = "https://image.tmdb.org/t/p/w300";
final String _imageLargeUrl = "https://image.tmdb.org/t/p/w500";
String getMediumPictureUrl(String path) => _imageMediumUrl + path;
String getLargePictureUrl(String path) =>  _imageLargeUrl + path;