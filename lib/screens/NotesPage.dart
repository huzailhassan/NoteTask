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
        key: UniqueKey(),
        appBar: AppBar(
          title: Text("Notelets"),
        ),
        body: (ListView.builder(
          key: UniqueKey(),
          itemCount: Task.listOfTasks.length,
          itemBuilder: (context, index) {
            final item = Task.listOfTasks[index];

            return ListTile(
                leading: const Icon(Icons.note),
                title: Text(item.name),
                subtitle: Text(item.description),
                onTap: () {
                  setState(() {
                    NoteInfo.selectedTask = item;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NoteInfo()),
                    );
                  });
                });
          },
        )));
  }
}
