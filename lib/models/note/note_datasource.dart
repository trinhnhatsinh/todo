class NoteModel {
  late String id;
  late String title;
  late String description;
  late String date;
  late String time;
  late bool checked;

  NoteModel(
      {this.id = '',
      this.title = '',
      this.description = '',
      this.date = '',
      this.time = '',
      this.checked = false});

  NoteModel.initial()
      : id = '',
        title = '',
        description = '',
        date = '',
        time = '',
        checked = false;

  NoteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    description = json['description'] ?? 0;
    title = json['title'] ?? '';
    date = json['date'] ?? 0;
    time = json['time'] ?? '';
    checked = json['checked'] ?? false;
  }

  Map<String, dynamic> toMap() => {
        "id": this.id,
        "title": this.title,
        "description": this.description,
        "date": this.date,
        "time": this.time,
        "checked": this.checked,
      };
}
