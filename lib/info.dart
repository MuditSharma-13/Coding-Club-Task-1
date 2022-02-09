import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[400],
      body: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Container(
          child: Text(
            "1. The game is played on a 3 x 3 grid\n\n\n\n2. You are X, your friend is O. Players take turns putting their marks in empty squares\n\n\n\n3. The first player to get 3 of their marks in a row (up, down, across, or diagonally) is the winner\n\n\n\n4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a draw\n\n\n\n5. The person who lost the last game would move first in the next game",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
