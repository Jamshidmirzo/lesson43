import 'package:lesson43/models/todo.dart';

class TodoController {
  List<Todo> _list = [];
  List<Todo> get list {
    return [..._list];
  }

  adddtask(int id, String description, String title, DateTime date) {
    print(id);
    print(description);
    print(title);
    print(date);
    _list.add(
      Todo(id: id, description: description, title: title, date: date),
    );
  }
}
