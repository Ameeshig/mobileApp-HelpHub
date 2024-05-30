import 'package:flutter/material.dart';
import 'start_screen.dart';
import 'user_repository.dart';
import 'task_repository.dart';

void main() {
  runApp(HelpHubApp());
}

class HelpHubApp extends StatelessWidget {
  final UserRepository userRepository = UserRepository();
  final TaskRepository taskRepository = TaskRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartScreen(userRepository: userRepository, taskRepository: taskRepository),
      debugShowCheckedModeBanner: false,
    );
  }
}
