import 'todo.dart';

class Task {
  int id;
  String name;
  String description;
  DateTime date = DateTime.now();
  final List<ToDo> todos;

  Task(this.id, this.name, this.description, this.date, this.todos);

  static List<Task> listOfTasks = [
    Task(13004, 'Task 1', 'I have an idea to put in this new task',
        DateTime.now(), [
      ToDo(34443, 'Todo 1', false),
      ToDo(45666, 'Todo 2', false),
    ]),
    Task(55002, 'Task 2', 'I have an idea to put in this new task',
        DateTime.now(), [
      ToDo(34443, 'Todo 3', false),
      ToDo(24666, 'Todo 4', false),
    ])
  ];

  static push(Task task) {
    listOfTasks.add(task);
  }

  void delete(Task task) {
    // for loop
  }
}
