import 'package:flutter/material.dart';
import 'package:untitled/models/task.dart';

class NoteInfo extends StatefulWidget {
  static var selectedTask;

  const NoteInfo({Key? key}) : super(key: key);

  @override
  _NoteInfoState createState() => _NoteInfoState();
}

class _NoteInfoState extends State<NoteInfo> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    TextEditingController nameController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    TextEditingController toDoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(NoteInfo.selectedTask.name),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Change Name'),
                    content: TextField(
                      controller: descriptionController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          hintText: NoteInfo.selectedTask.description),
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => {
                          setState(() {
                            Navigator.pop(context, 'OK');
                            Task.changeDescription(
                                NoteInfo.selectedTask.id,
                                nameController.text,
                                descriptionController.text);
                          }),
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.edit,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            child: ListView(
              children: <Widget>[
                Text(NoteInfo.selectedTask.description),
                ListView.builder(
                  key: UniqueKey(),
                  shrinkWrap: true,
                  itemCount: NoteInfo.selectedTask.todos.length,
                  itemBuilder: (context, index) {
                    final item = NoteInfo.selectedTask.todos[index];

                    return ListTile(
                        leading: Icon(item.isDone
                            ? Icons.check_box_outline_blank_outlined
                            : Icons.check_box_outlined),
                        title: Text(item.description),
                        onTap: () {
                          setState(() {
                            Task.changeToDone(
                                NoteInfo.selectedTask.id, item.id);
                          });
                        });
                  },
                ),
                Container(
                  width: screenSize.width,
                  child: RaisedButton(
                    child: const Text(
                      'Add New Subtask',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('Add Subtask'),
                        content: TextField(
                          controller: toDoController,
                          decoration: InputDecoration(
                              hintText: 'Step One: Set Oven to 365 degrees'),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => {
                              Task.addToDo(
                                NoteInfo.selectedTask.id,
                                toDoController.text,
                              ),
                              Navigator.pop(context, 'Cancel')
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    color: Colors.blue,
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                ),
                Container(
                  width: screenSize.width,
                  child: RaisedButton(
                    child: const Text(
                      'Delete Task',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        Task.deleteTask(NoteInfo.selectedTask.id);
                        Navigator.pop(context, true);
                      });
                    },
                    color: Colors.red,
                  ),
                  margin: EdgeInsets.only(top: 20.0),
                ),
              ],
            ),
          )),
    );
  }
}
