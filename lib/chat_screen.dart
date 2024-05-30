import 'package:flutter/material.dart';
import 'chat_detail.dart';
import 'new_conversation.dart';

class InboxScreen extends StatefulWidget {
  final List<Map<String, dynamic>> messages;
  final Function(String) addNewConversation;
  final Function(String, String) updateLastMessage;

  InboxScreen({
    required this.messages,
    required this.addNewConversation,
    required this.updateLastMessage,
  });

  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inbox'),
        automaticallyImplyLeading: false, // Removes the back arrow
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewConversationScreen(
                    onNewConversation: widget.addNewConversation,
                  ),
                ),
              );
            },
          ),
        ],
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
            itemCount: widget.messages.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(widget.messages[index]['name']),
                  subtitle: Text(widget.messages[index]['lastMessage']),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(
                          name: widget.messages[index]['name'],
                          onUpdateLastMessage: widget.updateLastMessage,
                          chatHistory: widget.messages[index]['chatHistory'],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
