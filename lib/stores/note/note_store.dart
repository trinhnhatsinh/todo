import 'dart:convert';
import 'package:boilerplate/data/local/datasources/note/note_datasource.dart';
import 'package:mobx/mobx.dart';

import 'package:boilerplate/models/note/note_datasource.dart';

part 'note_store.g.dart';

class NoteStore = _NoteStore with _$NoteStore;

abstract class _NoteStore with Store {
  @observable
  bool loading = false;

  @observable
  bool isHasCarts = false;

  @observable
  List<NoteModel> notes = [];

  @observable
  List<NoteModel> todayNotes = [];

  @observable
  List<NoteModel> upcomingNotes = [];

  @observable
  List<NoteModel> searchNotes = [];

  @observable
  int totalPrice = 0;

  // constructor:---------------------------------------------------------------
  _NoteStore() {
    init();
  }

  // general:-------------------------------------------------------------------
  void init() async {}

  // dispose:-------------------------------------------------------------------
  @override
  dispose() {}

  @action
  Future<void> load() async {
    NoteDataSource _noteDataSource = NoteDataSource();
    try {
      notes = await _noteDataSource.getNotes();

      List<NoteModel> todayTemps = [];
      List<NoteModel> upcomingTemps = [];

      for (NoteModel item in notes) {
        List<String> datetemp = item.date.split('-');
        DateTime dataNow = DateTime.now();

        print(DateTime.utc(dataNow.year, dataNow.month, dataNow.day)
            .millisecondsSinceEpoch);

        print(DateTime.utc(int.parse(datetemp[0]), int.parse(datetemp[1]),
                int.parse(datetemp[2]))
            .millisecondsSinceEpoch);

        if (DateTime.utc(int.parse(datetemp[0]), int.parse(datetemp[1]),
                    int.parse(datetemp[2]))
                .millisecondsSinceEpoch ==
            DateTime.utc(dataNow.year, dataNow.month, dataNow.day)
                .millisecondsSinceEpoch) {
          todayTemps.add(item);
        }

        if (DateTime.utc(int.parse(datetemp[0]), int.parse(datetemp[1]),
                    int.parse(datetemp[2]))
                .millisecondsSinceEpoch >
            DateTime.utc(dataNow.year, dataNow.month, dataNow.day)
                .millisecondsSinceEpoch) {
          upcomingTemps.add(item);
        }
      }

      todayNotes = todayTemps;
      upcomingNotes = upcomingTemps;
    } catch (e) {}
  }

  @action
  Future<void> add(NoteModel val) async {
    NoteDataSource _noteDataSource = NoteDataSource();
    await _noteDataSource.insert(val);

    this.load();
  }

  @action
  Future<void> check(NoteModel val) async {
    NoteDataSource _noteDataSource = NoteDataSource();
    await _noteDataSource.update(val);
    print('vao');
    this.load();
  }

  @action
  Future<void> delete(NoteModel val) async {
    NoteDataSource _noteDataSource = NoteDataSource();
    await _noteDataSource.delete(val);
    this.load();
  }

  @action
  Future<void> search(String key) async {
    this.searchNotes = this
        .notes
        .where((element) =>
            element.title.toLowerCase().contains(key.toLowerCase()))
        .toList();
  }
}
