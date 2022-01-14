import 'package:flutter/material.dart';
import 'package:untitled/models/task.dart';
import 'package:untitled/models/todo.dart';
import 'dart:developer';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    TextEditingController titleController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();

    void _onClickNewTask(int index) {
      setState(() {
        var taska = Task('Task 1', 'I have an idea to put in this new task',
            DateTime.now(), [
          ToDo('Todo 1', false),
          ToDo('Todo 2', false),
        ]);

        Task.listOfTasks.add(taska);

        log('data: $taska');
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                    controller: titleController,
                    keyboardType: TextInputType
                        .emailAddress, // Use email input type for emails.
                    decoration: const InputDecoration(
                        labelText: 'Title', hintText: 'Pie Creation')),
                TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        labelText: 'Description',
                        hintText:
                            'i got this nice idea for a new pie to create tonight. Aunt Katie gave me a recipe and I have improved on it by adding more lemon and sugar. I need the following items in this tasks list which I plan to get tommorow. The directions are also in the tasks. ')),
                Container(
                  width: screenSize.width,
                  child: RaisedButton(
                    child: const Text(
                      'Add New Task',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => _onClickNewTask,
                    color: Colors.blue,
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                )
              ],
            ),
          )),
    );
  }
}
