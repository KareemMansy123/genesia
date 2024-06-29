import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../../core/widgets/chat_bubble.dart';

class ChatScreen extends StatefulWidget {
  final Map<String, String>? character;

  ChatScreen({this.character});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = [];
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? messages = prefs.getString('messages_${widget.character!['name']}');
    if (messages != null) {
      setState(() {
        _messages.addAll(List<Map<String, dynamic>>.from(json.decode(messages)));
      });
    }
  }

  Future<void> _saveMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('messages_${widget.character!['name']}', json.encode(_messages));
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': _controller.text,
          'isSentByUser': true,
          'timestamp': DateTime.now().toString(),
        });
        _controller.clear();
        _saveMessages();
        _isLoading = true;
      });
      _scrollToBottom();
      // Simulate a response from the character
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _messages.add({
            'text': 'Response from ${widget.character!['name']}',
            'isSentByUser': false,
            'timestamp': DateTime.now().toString(),
          });
          _saveMessages();
          _scrollToBottom();
          _isLoading = false;
        });
      });
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.character!['name']}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                DateTime timestamp = DateTime.parse(_messages[index]['timestamp']);
                return ChatBubble(
                  message: _messages[index]['text'],
                  isSentByUser: _messages[index]['isSentByUser'],
                  timestamp: timestamp,
                );
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
