import 'todo.dart';

class Task {
  String name;
  String description;
  DateTime date;
  final List<ToDo> todos;

  Task(this.name, this.description, this.date, this.todos);
}
