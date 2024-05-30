import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart' as sf;
import 'task_model.dart';

class CalendarView extends StatelessWidget {
  final List<Task> tasks;

  CalendarView({required this.tasks});

  @override
  Widget build(BuildContext context) {
    return sf.SfCalendar(
      view: sf.CalendarView.month,
      dataSource: TaskDataSource(tasks),
    );
  }
}

class TaskDataSource extends sf.CalendarDataSource {
  TaskDataSource(List<Task> tasks) {
    appointments = tasks.map((task) {
      final date = DateTime.parse(task.date);
      final time = TimeOfDay(
        hour: int.parse(task.time.split(':')[0]),
        minute: int.parse(task.time.split(':')[1]),
      );

      final startTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );

      return sf.Appointment(
        startTime: startTime,
        endTime: startTime.add(Duration(hours: 1)),
        subject: task.title,
        location: task.location,
        notes: task.description,
      );
    }).toList();
  }
}
