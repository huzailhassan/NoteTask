import 'package:flutter/material.dart';

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
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: const <Widget>[
              Text("I'm dedicating every day to you"),
              Text('Domestic life was never quite my style'),
              Text('When you smile, you knock me out, I fall apart'),
              Text('And I thought I was so smart'),
            ],
          ),
        ));
  }
}
