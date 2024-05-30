import 'package:flutter/material.dart';
import 'task_model.dart';

class TaskDetailScreen extends StatelessWidget {
  final Task task;
  final VoidCallback onSignUp;

  TaskDetailScreen({required this.task, required this.onSignUp});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(task.title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Date: ${task.date}'),
            Text('Time: ${task.time}'),
            Text('Location: ${task.location}'),
            SizedBox(height: 10),
            Text(task.description),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Sign Up'),
          onPressed: onSignUp,
        ),
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
