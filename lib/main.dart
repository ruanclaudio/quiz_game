import 'package:flutter/material.dart';
import 'package:atvd_quiz/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Senai',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}
