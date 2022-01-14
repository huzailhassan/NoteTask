import 'todo.dart';

class Task {
  String name;
  String description;
  DateTime date = DateTime.now();
  final List<ToDo> todos;

  Task(this.name, this.description, this.date, this.todos);

  static List<Task> listOfTasks = [
    Task('Task 1', 'I have an idea to put in this new task', DateTime.now(), [
      ToDo('Todo 1', false),
      ToDo('Todo 2', false),
    ]),
    Task('Task 2', 'I have an idea to put in this new task', DateTime.now(), [
      ToDo('Todo 1', false),
      ToDo('Todo 2', false),
    ])
  ];


}
