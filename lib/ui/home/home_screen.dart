import 'package:flutter/material.dart';

import '../character_selection/character_selection_screen.dart';
import '../chat/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, String>? character;

  const HomeScreen({super.key, this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Genesia Home'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => CharacterSelectionScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (character != null) ...[
              CircleAvatar(
                backgroundImage: AssetImage(character!['image']!),
                radius: 50,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome, ${character!['name']}!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'Get ready to start your journey with ${character!['name']} and explore the world of Genesia.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(character: character),
                    ),
                  );
                },
                child: Text('Chat with ${character!['name']}'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
              ),
            ] else ...[
              Text(
                'Welcome to Genesia!',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

