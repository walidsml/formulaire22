import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
