import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.page.dart'; // Assuming HomePage is already created

void main() async {
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
      home: SplashPage(),  // Set SplashPage as the home page
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();

    // Start a delay to transition to the HomePage
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isVisible = false; // Hide the logo after the delay
      });
      // After fade out, navigate to HomePage
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage())
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // Black background
      body: Center(
        child: AnimatedOpacity(
          opacity: _isVisible ? 1.0 : 0.0, // Fade in/out effect
          duration: Duration(seconds: 1), // Duration of the fade effect
          child: Column(
            mainAxisSize: MainAxisSize.min, // Center the content vertically
            children: [
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0, // Fade in/out effect for the logo
                duration: Duration(seconds: 1),
                child: Image.asset(
                  'image/frtlogo.png', // Your app's logo
                  width: 150,
                  height: 150,
                ),
              ),
              SizedBox(height: 20), // Space between logo and title
              AnimatedOpacity(
                opacity: _isVisible ? 1.0 : 0.0, // Fade in/out effect for the title
                duration: Duration(seconds: 1),
                child: Text(
                  'Fruit Classifier',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
