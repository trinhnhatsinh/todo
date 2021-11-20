import 'package:boilerplate/data/local/constants/db_constants.dart';
import 'package:boilerplate/models/note/note_datasource.dart';
import 'package:sembast/sembast.dart';
import 'package:boilerplate/data/local/datasources/app_database.dart';

class NoteDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _notesStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  // DB functions:--------------------------------------------------------------
  Future<int> insert(NoteModel note) async {
    print(note.toMap());
    return await _notesStore.add(await _db, note.toMap());
  }

  Future<List<NoteModel>> getNotes() async {
    List<NoteModel> cartsList = [];

    // fetching data
    final recordSnapshots = await _notesStore.find(
      await _db,
    );
    // Making a List<Post> out of List<RecordSnapshot>
    if (recordSnapshots.length > 0) {
      cartsList = recordSnapshots.map((snapshot) {
        final post = NoteModel.fromJson(snapshot.value);
        return post;
      }).toList();
    }

    return cartsList;
  }

  Future<int> update(NoteModel note) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.

    final finder = Finder(filter: Filter.equals('id', note.id));
    return await _notesStore.update(
      await _db,
      note.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(NoteModel note) async {
    final finder = Finder(filter: Filter.equals('id', note.id));
    return await _notesStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _notesStore.drop(
      await _db,
    );
  }
}
