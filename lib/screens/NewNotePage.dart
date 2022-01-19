import 'package:flutter/material.dart';
import 'package:untitled/models/task.dart';
import 'package:untitled/models/todo.dart';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController subTaskController = TextEditingController();

  static List<ToDo> subTasks = [];

  get random => null;
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: ListView(
              children: <Widget>[
                TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        labelText: 'Title', hintText: 'Pie Creation')),
                TextFormField(
                    maxLines: 10,
                    minLines: 1,
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        labelText: 'Description',
                        hintText:
                            'i got this nice idea for a new pie to create tonight. Aunt Katie gave me a recipe and I have improved on it by adding more lemon and sugar. I need the following items in this tasks list which I plan to get tommorow. The directions are also in the tasks. ')),
                TextFormField(
                    controller: subTaskController,
                    keyboardType: TextInputType
                        .emailAddress, // Use email input type for emails.
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            var random = Random();
                            subTasks.add(ToDo(random.nextInt(10000),
                                subTaskController.text, false));
                            subTaskController.text = '';
                          });
                        },
                      ),
                      hintText: 'Buy Eggs',
                      labelText: 'Add a SubTask',
                    )),
                Text("Added subtasks:"),
                ListView.builder(
                  key: UniqueKey(),
                  shrinkWrap: true,
                  itemCount: subTasks.length,
                  itemBuilder: (context, index) {
                    final item = subTasks[index];

                    return ListTile(
                        leading: const Icon(Icons.delete),
                        title: Text(item.description),
                        onTap: () {
                          setState(() {
                            List<ToDo> newArray = [];
                            for (var i = 0; i < subTasks.length; i++) {
                              if (subTasks[i].id != item.id) {
                                newArray.add(subTasks[i]);
                              }
                            }
                            subTasks = newArray;
                          });
                        });
                  },
                ),
                Container(
                  width: screenSize.width,
                  child: RaisedButton(
                    child: const Text(
                      'Add Task',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        var random = Random();
                        var taska = Task(
                            random.nextInt(10000),
                            titleController.text,
                            descriptionController.text,
                            DateTime.parse("2022-01-19 00:00:00.000Z"),
                            subTasks);
                        Task.addTask(taska);
                        subTasks = [];
                        titleController.text = '';
                        descriptionController.text = '';
                      });
                    },
                    color: Colors.blue,
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                ),
              ],
            ),
          )),
    );
  }
}
