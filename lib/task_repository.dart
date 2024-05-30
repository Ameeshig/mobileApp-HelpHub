import 'task_model.dart';

class TaskRepository {
  List<Task> _tasks = [
    Task(
      title: 'Task Title: Dog Walking',
      date: '2024-06-12',
      time: '16:00',
      location: 'ABC residence',
      description: 'Walk my Dog',
    ),
    Task(
      title: 'Task Title: Others',
      date: '2024-06-10',
      time: '15:30',
      location: 'ABC residence',
      description: 'Look after my child of 5 years (Boy) for 2 hours. Will pay Rs.500',
    ),
  ];

  List<Task> _signedUpTasks = [];

  List<Task> getTasks() {
    return _tasks;
  }

  void addTask(Task task) {
    _tasks.add(task);
  }

  void removeTask(Task task) {
    _tasks.remove(task);
  }

  void signUpForTask(Task task) {
    _signedUpTasks.add(task);
    removeTask(task);
  }

  List<Task> getSignedUpTasks() {
    return _signedUpTasks;
  }
}
