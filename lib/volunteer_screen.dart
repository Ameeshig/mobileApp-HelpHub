import 'package:flutter/material.dart';
import 'task_model.dart';
import 'task_repository.dart';
import 'task_detail_screen.dart';

class TaskListScreen extends StatefulWidget {
  final TaskRepository taskRepository;

  TaskListScreen({required this.taskRepository});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  void _showTaskDetail(Task task) {
    showDialog(
      context: context,
      builder: (context) {
        return TaskDetailScreen(
          task: task,
          onSignUp: () {
            setState(() {
              widget.taskRepository.signUpForTask(task);
              Navigator.pop(context);
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = widget.taskRepository.getTasks();

    return Scaffold(
      appBar: AppBar(
        title: Text('Task List'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background2.png'), // Ensure the image is in your assets folder
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(tasks[index].title),
                  subtitle: Text('Date: ${tasks[index].date} Time: ${tasks[index].time}\nLocation: ${tasks[index].location}'),
                  onTap: () => _showTaskDetail(tasks[index]),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
