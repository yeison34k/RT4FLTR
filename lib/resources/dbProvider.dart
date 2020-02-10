import 'package:pelis/model/cast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'dart:async';

class DBProvider {
  static final DBProvider _dBProvider = new DBProvider();
  Database db;

  DBProvider() {
    init();
  }

  static DBProvider get() {
    return _dBProvider;
  }

  void init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "Cast4.db");
    this.db = await openDatabase(path, version: 1,
        onCreate: (Database newDb, int version) {
      createCast(newDb, version);
    });
  }

  void createCast(Database newDb, int version) {
    newDb.execute(""" 
        create table Cast (
        id  integer primary key,
        name text,
        profile_path text,
        media_id integer
        );
        """);
  }

  Future<List<Cast>> fechCast(int mediaId) async {
    var maps =
        await db.query("Cast", where: "media_id = ?", whereArgs: [mediaId]);

    if (maps.isNotEmpty) {
      return maps.map<Cast>((item) => new Cast.fromDb(item)).toList();
    }
    return null;
  }

  addCast(Cast cast) {
    db.insert("Cast", cast.toMap(), conflictAlgorithm: ConflictAlgorithm.rollback);
  }
}
