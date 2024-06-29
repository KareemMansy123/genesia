import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class CharacterSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> characters = [
    {'name': 'Character 1', 'image': 'assets/images/character1.png'},
    {'name': 'Character 2', 'image': 'assets/images/character2.jpg'},
    {'name': 'Character 3', 'image': 'assets/images/character3.jpg'},
    {'name': 'Character 4', 'image': 'assets/images/character4.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Character'),
        backgroundColor: Colors.blueAccent,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: characters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to the main app screen with the selected character
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    character: characters[index],
                  ),
                ),
              );
            },
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
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text(
                    characters[index]['name']!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
