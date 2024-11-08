import 'package:flutter/material.dart';

import 'home.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          textTheme: TextTheme(
            displayLarge: TextStyle(fontSize: 45, color: Colors.black)
          ),
      colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
          primary: Colors.lightGreenAccent),
          indicatorColor: Colors.purple),
    home: HomePage());
  }
}
