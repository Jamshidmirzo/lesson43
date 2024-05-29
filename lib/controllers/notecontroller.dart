import 'package:lesson43/models/note.dart';

class Notecontroller {
  List<Note> _list = [];

  List<Note> get list {
    return [..._list];
  }

  adddtask(int id, String description, String title, DateTime date) {
    _list.add(
      Note(title: title, id: id, content: description, CreatedTime: date),
    );
  }
}
