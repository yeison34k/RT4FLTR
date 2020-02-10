import 'package:pelis/model/cast.dart';
import 'package:pelis/resources/apiProvider.dart';
import 'package:pelis/resources/dbProvider.dart';

class Repository {
  static final Repository _repository = new Repository();

  ApiProvider api = ApiProvider.get();
  DBProvider db = DBProvider.get();

  static Repository get() {
    return _repository;
  }

  Future<List<Cast>> fechCast(int mediaId) async {
    List<Cast> list = await db.fechCast(mediaId);
    if (list != null) {
      return list;
    }

    list = await api.fechCastMovies(mediaId);
    list.forEach((x) => db.addCast(x));

    return list;
  }

  Future<List<Cast>> fechCastTv(int mediaId) async {
    List<Cast> list = await db.fechCast(mediaId);
    if (list != null) {
      return list;
    }

    list = await api.fechCastTv(mediaId);
    print("******");
    print(list.toString());
    list.forEach((x) => db.addCast(x));

    return list;
  }
}
