import 'package:flutter/material.dart';

import 'screens/CalendarPage.dart';
import 'screens/NotesPage.dart';
import 'screens/NewNotePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  int _currentIndex = 1;
  final List<Widget> _children = [
    Calendar(),
    NewNotePage(),
    NotesPage(),
  ];
  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text("Calendar")),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), title: Text("New Note")),
          BottomNavigationBarItem(
              icon: Icon(Icons.notes), title: Text("Notes")),
        ],
      ),
    );
  }
}
