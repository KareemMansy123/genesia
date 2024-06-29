import 'package:flutter/material.dart';

import '../../core/widgets/custom_button.dart';
import '../character_selection/character_selection_screen.dart';
import '../chat/chat_screen.dart';
import '../settings/settings_screen.dart';


class HomeScreen extends StatelessWidget {
  final Map<String, String>? character;

  HomeScreen({this.character});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Genesia Home'),
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
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
                radius: screenSize.width * 0.15,
              ),
              SizedBox(height: screenSize.height * 0.02),
              Text(
                'Welcome, ${character!['name']}!',
                style: TextStyle(fontSize: screenSize.width * 0.06, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenSize.height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
                child: Text(
                  'Get ready to start your journey with ${character!['name']} and explore the world of Genesia.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: screenSize.width * 0.04, color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: screenSize.height * 0.02),
              CustomButton(
                text: 'Chat with ${character!['name']}',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatScreen(character: character),
                    ),
                  );
                },
              ),
            ] else ...[
              Text(
                'Welcome to Genesia!',
                style: TextStyle(fontSize: screenSize.width * 0.06),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
