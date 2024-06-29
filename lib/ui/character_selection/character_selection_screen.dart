import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

import '../home/home_screen.dart';

class CharacterSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> characters = [
    {'name': 'Character 1', 'image': 'assets/images/character1.png'},
    {'name': 'Character 2', 'image': 'assets/images/character2.jpg'},
    {'name': 'Character 3', 'image': 'assets/images/character3.jpg'},
    {'name': 'Character 4', 'image': 'assets/images/character4.jpg'},
  ];

  void _onCharacterTap(BuildContext context, Map<String, String> character) {
    if (Vibration.hasVibrator() != null) {
      Vibration.vibrate(duration: 50);
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(character: character),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Character'),
        backgroundColor: Colors.blueAccent,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(screenSize.width * 0.02),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: screenSize.width > 600 ? 4 : 2,
          crossAxisSpacing: screenSize.width * 0.02,
          mainAxisSpacing: screenSize.height * 0.02,
        ),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _onCharacterTap(context, characters[index]),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(characters[index]['image']!),
                    radius: screenSize.width * 0.1,
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                  Text(
                    characters[index]['name']!,
                    style: TextStyle(fontSize: screenSize.width * 0.05, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
