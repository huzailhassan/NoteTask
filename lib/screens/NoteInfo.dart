import 'package:flutter/material.dart';
import 'package:untitled/models/task.dart';

class NoteInfo extends StatefulWidget {
  static var selectedTaskID = 1;

  const NoteInfo({Key? key}) : super(key: key);

  @override
  _NoteInfoState createState() => _NoteInfoState();
}

class _NoteInfoState extends State<NoteInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("NotsssesPage Page"),
    ));
  }
}
