import 'package:flutter/material.dart';
import 'package:untitled/models/task.dart';
import 'package:untitled/screens/NoteInfo.dart';

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
        body: (ListView.builder(
          itemCount: Task.listOfTasks.length,
          itemBuilder: (context, index) {
            final item = Task.listOfTasks[index];

            return ListTile(
                leading: const Icon(Icons.note),
                title: Text(item.name),
                subtitle: Text(item.description),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NoteInfo()),
                  );
                  NoteInfo.selectedTaskID = 1;
                });
          },
        )));
  }
}
