import 'package:flutter/material.dart';
import 'dart:math';

import 'package:frases_motivacionales_app/screens/motivational_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frases Motivacionales',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        useMaterial3: true,
      ),
      home: MotivationalScreen(),
    );
  }
}
