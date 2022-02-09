import 'package:flutter/material.dart';
import 'package:tic_tac_toe/homepage.dart';
import 'package:tic_tac_toe/maingame.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
