import 'package:flutter/material.dart';

import 'CalendarPage.dart';
import 'NotesPage.dart';
import 'NewNotePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [CalendarPage(), NewNotePage(), NotesPage()];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: new Icon(Icons.calendar_today),
              title: new Text("Calendar")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.add), title: new Text("New Note")),
          BottomNavigationBarItem(
              icon: new Icon(Icons.notes), title: new Text("Notes")),
        ],
      ),
    );
  }
}
