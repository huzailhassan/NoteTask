import 'package:flutter/material.dart';
import 'package:untitled/models/task.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("NotesPage Page"),
        ),
        body: (
          ListView.builder(
            // Let the ListView know how many items it needs to build.
            itemCount: Task.listOfTasks.length,
            // Provide a builder function. This is where the magic happens.
            // Convert each item into a widget based on the type of item it is.
            itemBuilder: (context, index) {
              final item = Task.listOfTasks[index];

              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.description),
              );
              
            },
          )
        ));
  }
}
