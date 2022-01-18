import 'dart:math';

import 'todo.dart';

class Task {
  int id;
  String name;
  String description;
  DateTime date;
  List<ToDo> todos;

  Task(this.id, this.name, this.description, this.date, this.todos, {title});

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

// Task
  static addTask(Task task) {
    listOfTasks.add(task);
  }

  static void deleteTask(id) {
    List<Task> newArray = [];
    for (var i = 0; i < listOfTasks.length; i++) {
      if (listOfTasks[i].id != id) {
        newArray.add(listOfTasks[i]);
      }
    }
    Task.listOfTasks = newArray;
  }

  static void changeToDone(taskID, todoID) {
    for (var i = 0; i < listOfTasks.length; i++) {
      if (listOfTasks[i].id == taskID) {
        for (var j = 0; j < listOfTasks[i].todos.length; j++) {
          if (listOfTasks[i].todos[j].id == todoID) {
            listOfTasks[i].todos[j].isDone = !listOfTasks[i].todos[j].isDone;
          }
        }
      }
    }
  }

  static changeDescription(taskID, newName, newDescription) {
    for (var i = 0; i < listOfTasks.length; i++) {
      if (listOfTasks[i].id == taskID) {
        listOfTasks[i].name = newName;
        listOfTasks[i].description = newDescription;
      }
    }
  }

// ToDo
  static addToDo(id, String newTask) {
    print(newTask);
    var random = Random();
    var newTask2 = ToDo(random.nextInt(10000), newTask, false);
    for (var i = 0; i < listOfTasks.length; i++) {
      if (listOfTasks[i].id == id) {
        listOfTasks[i].todos.add(newTask2);
      }
    }
  }

  static deleteToDo(taskID, itemID) {
    
    List<ToDo> newArray = [];
    for (var i = 0; i < listOfTasks.length + 1; i++) {
      if (listOfTasks[i].id == taskID) {
        for (var j = 0; j < listOfTasks[i].todos.length; j++) {
          if (listOfTasks[i].todos[j].id != itemID) {
            newArray.add(listOfTasks[i].todos[j]);
          }
        }
        listOfTasks[i].todos = newArray;
      }
    }
  }
}
