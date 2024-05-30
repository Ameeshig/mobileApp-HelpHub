import 'package:flutter/material.dart';
import 'task_model.dart';

class ToDoListView extends StatefulWidget {
  final List<Task> tasks;

  ToDoListView({required this.tasks});

  @override
  _ToDoListViewState createState() => _ToDoListViewState();
}

class _ToDoListViewState extends State<ToDoListView> {
  late Map<Task, bool> _taskCompletion;

  @override
  void initState() {
    super.initState();
    // Initialize the map to store task completion status
    _taskCompletion = {for (var task in widget.tasks) task: false};
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        Task task = widget.tasks[index];
        return CheckboxListTile(
          title: Text(task.title),
          subtitle: Text('Date: ${task.date} Time: ${task.time}\nLocation: ${task.location}'),
          value: _taskCompletion[task],
          onChanged: (bool? value) {
            setState(() {
              _taskCompletion[task] = value!;
            });
          },
        );
      },
    );
  }
}
