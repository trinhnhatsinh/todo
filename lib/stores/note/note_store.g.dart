// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NoteStore on _NoteStore, Store {
  final _$loadingAtom = Atom(name: '_NoteStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$isHasCartsAtom = Atom(name: '_NoteStore.isHasCarts');

  @override
  bool get isHasCarts {
    _$isHasCartsAtom.reportRead();
    return super.isHasCarts;
  }

  @override
  set isHasCarts(bool value) {
    _$isHasCartsAtom.reportWrite(value, super.isHasCarts, () {
      super.isHasCarts = value;
    });
  }

  final _$notesAtom = Atom(name: '_NoteStore.notes');

  @override
  List<NoteModel> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(List<NoteModel> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  final _$todayNotesAtom = Atom(name: '_NoteStore.todayNotes');

  @override
  List<NoteModel> get todayNotes {
    _$todayNotesAtom.reportRead();
    return super.todayNotes;
  }

  @override
  set todayNotes(List<NoteModel> value) {
    _$todayNotesAtom.reportWrite(value, super.todayNotes, () {
      super.todayNotes = value;
    });
  }

  final _$upcomingNotesAtom = Atom(name: '_NoteStore.upcomingNotes');

  @override
  List<NoteModel> get upcomingNotes {
    _$upcomingNotesAtom.reportRead();
    return super.upcomingNotes;
  }

  @override
  set upcomingNotes(List<NoteModel> value) {
    _$upcomingNotesAtom.reportWrite(value, super.upcomingNotes, () {
      super.upcomingNotes = value;
    });
  }

  final _$searchNotesAtom = Atom(name: '_NoteStore.searchNotes');

  @override
  List<NoteModel> get searchNotes {
    _$searchNotesAtom.reportRead();
    return super.searchNotes;
  }

  @override
  set searchNotes(List<NoteModel> value) {
    _$searchNotesAtom.reportWrite(value, super.searchNotes, () {
      super.searchNotes = value;
    });
  }

  final _$totalPriceAtom = Atom(name: '_NoteStore.totalPrice');

  @override
  int get totalPrice {
    _$totalPriceAtom.reportRead();
    return super.totalPrice;
  }

  @override
  set totalPrice(int value) {
    _$totalPriceAtom.reportWrite(value, super.totalPrice, () {
      super.totalPrice = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_NoteStore.load');

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  final _$addAsyncAction = AsyncAction('_NoteStore.add');

  @override
  Future<void> add(NoteModel val) {
    return _$addAsyncAction.run(() => super.add(val));
  }

  final _$checkAsyncAction = AsyncAction('_NoteStore.check');

  @override
  Future<void> check(NoteModel val) {
    return _$checkAsyncAction.run(() => super.check(val));
  }

  final _$deleteAsyncAction = AsyncAction('_NoteStore.delete');

  @override
  Future<void> delete(NoteModel val) {
    return _$deleteAsyncAction.run(() => super.delete(val));
  }

  final _$searchAsyncAction = AsyncAction('_NoteStore.search');

  @override
  Future<void> search(String key) {
    return _$searchAsyncAction.run(() => super.search(key));
  }

  @override
  String toString() {
    return '''
loading: ${loading},
isHasCarts: ${isHasCarts},
notes: ${notes},
todayNotes: ${todayNotes},
upcomingNotes: ${upcomingNotes},
searchNotes: ${searchNotes},
totalPrice: ${totalPrice}
    ''';
  }
}
