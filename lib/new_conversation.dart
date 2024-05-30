import 'package:flutter/material.dart';

class NewConversationScreen extends StatelessWidget {
  final Function(String) onNewConversation;
  final TextEditingController _controller = TextEditingController();

  NewConversationScreen({required this.onNewConversation});

  void _startConversation(BuildContext context) {
    if (_controller.text.isNotEmpty) {
      onNewConversation(_controller.text);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start New Conversation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter Name',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _startConversation(context),
              child: Text('Start Conversation'),
            ),
          ],
        ),
      ),
    );
  }
}
