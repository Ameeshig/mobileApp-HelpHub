import 'package:flutter/material.dart';
import 'volunteer_screen.dart';
import 'chat_screen.dart';
import 'task_repository.dart';
import 'help_request_screen.dart';
import 'to_do_list_screen.dart';
import 'profile_screen.dart';
import 'user_repository.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  final TaskRepository taskRepository;
  final UserRepository userRepository;
  final User user;

  HomeScreen({
    required this.taskRepository,
    required this.userRepository,
    required this.user,
  });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> messages = [
    {
      'name': 'John Doe',
      'lastMessage': 'Hello, how are you?',
      'chatHistory': ['Hello, how are you?']
    },
    {
      'name': 'Jane Smith',
      'lastMessage': 'Are you coming to the meeting?',
      'chatHistory': ['Are you coming to the meeting?']
    },
    {
      'name': 'Bob Johnson',
      'lastMessage': 'Let\'s catch up soon!',
      'chatHistory': ['Let\'s catch up soon!']
    },
  ];

  void addNewConversation(String name) {
    setState(() {
      messages.add({
        'name': name,
        'lastMessage': '',
        'chatHistory': <String>[] // Initialize as List<String>
      });
    });
  }

  void updateLastMessage(String name, String lastMessage) {
    setState(() {
      final index = messages.indexWhere((msg) => msg['name'] == name);
      if (index != -1) {
        messages[index]['lastMessage'] = lastMessage;
        messages[index]['chatHistory'].add(lastMessage);
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = [
      HomeContent(
        taskRepository: widget.taskRepository,
        user: widget.user,
      ),
      ToDoListScreen(taskRepository: widget.taskRepository),
      InboxScreen(
        messages: messages,
        addNewConversation: addNewConversation,
        updateLastMessage: updateLastMessage,
      ),
      ProfileScreen(
        userRepository: widget.userRepository,
        user: widget.user,
      ),
    ];

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  final TaskRepository taskRepository;
  final User user;

  HomeContent({required this.taskRepository, required this.user});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background2.png'), // Ensure the image is in your assets folder
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: user.profileImage == null
                      ? AssetImage('assets/pp.jpeg')
                      : FileImage(File(user.profileImage!)) as ImageProvider,
                ),
                SizedBox(height: 8),
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TaskListScreen(
                              taskRepository: taskRepository)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Text(
                    'Looking to Volunteer',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HelpRequestScreen(
                              taskRepository: taskRepository)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.black),
                    ),
                  ),
                  child: Text(
                    'Looking for Help',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
