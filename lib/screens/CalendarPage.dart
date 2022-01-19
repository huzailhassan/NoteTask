import 'dart:math';

import 'package:untitled/screens/NoteInfo.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled/models/task.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Task>> selectedEvents = {};
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    selectedEvents[Task.listOfTasks[0].date] = [Task.listOfTasks[0]];

    for (var i = 1; i < Task.listOfTasks.length; i++) {
      selectedEvents[Task.listOfTasks[i].date] = [Task.listOfTasks[i]];
    }
    print(selectedEvents);
  }

  List<Task> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _descriptionController.dispose();

    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: selectedDay,
            firstDay: DateTime(2000),
            lastDay: DateTime(2025),
            calendarFormat: format,
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,

            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(selectedEvents);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },

            eventLoader: _getEventsfromDay,

            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              selectedTextStyle: const TextStyle(color: Colors.white),
              todayDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible: true,
              titleCentered: true,
              formatButtonShowsNext: false,
              formatButtonDecoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              formatButtonTextStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          ..._getEventsfromDay(selectedDay).map(
            (Task event) => ListTile(
                title: Text(
                  event.name,
                ),
                subtitle: Text(event.description),
                onTap: () {
                  setState(() {
                    NoteInfo.selectedTask = event;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NoteInfo()),
                    );
                  });
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Add Tasklet"),
            content: TextFormField(
              controller: _descriptionController,
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  var random = Random();

                  if (_descriptionController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]?.add(
                        Task(
                            random.nextInt(10000),
                            'New Tasklet' ,
                            _descriptionController.text,
                            DateTime.parse("2022-01-19 00:00:00.000Z"), []),
                      );
                      Task.listOfTasks.add(
                        Task(
                            random.nextInt(10000),
                            'New Tasklet',
                            _descriptionController.text,
                            DateTime.parse("2022-01-19 00:00:00.000Z"), []),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Task(
                            random.nextInt(10000),
                            'New Tasklet',
                            _descriptionController.text,
                            DateTime.parse("2022-01-19 00:00:00.000Z"), [])
                      ];
                      Task.listOfTasks.add(
                        Task(
                            random.nextInt(10000),
                            'New Tasklet',
                            _descriptionController.text,
                            DateTime.parse("2022-01-19 00:00:00.000Z"), []),
                      );
                    }
                  }
                  Navigator.pop(context);
                  _nameController.clear();
                  _descriptionController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text("Add Tasklet"),
        icon: Icon(Icons.add),
      ),
    );
  }
}
