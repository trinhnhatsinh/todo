import 'dart:async';

import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class AppDatabase {
  static final AppDatabase _singleton = AppDatabase._();

  static AppDatabase get instance => _singleton;

  late Completer<Database> _db;

  AppDatabase._();

  Future<Database> get database async {
    _db = Completer();
    _openDatabase();
    return _db.future;
  }

  Future _openDatabase() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    final dbPath = join(appDocumentDir.path, DBConstants.DB_NAME);

    final database = await databaseFactoryIo.openDatabase(dbPath);
    _db.complete(database);
  }
}
