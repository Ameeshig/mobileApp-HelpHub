import 'package:flutter/material.dart';
import 'task_repository.dart';
import 'calendar_view.dart';
import 'list_view.dart';
import 'task_model.dart';

class ToDoListScreen extends StatefulWidget {
  final TaskRepository taskRepository;

  ToDoListScreen({required this.taskRepository});

  @override
  _ToDoListScreenState createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    List<Task> signedUpTasks = widget.taskRepository.getSignedUpTasks();

    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
        automaticallyImplyLeading: false, // Removes the back arrow
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'List View'),
            Tab(text: 'Calendar View'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ToDoListView(tasks: signedUpTasks),
          CalendarView(tasks: signedUpTasks),
        ],
      ),
    );
  }
}
