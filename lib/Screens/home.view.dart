import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './TensorFlow.view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bienvenue, ${FirebaseAuth.instance.currentUser?.displayName ?? 'Utilisateur'} !',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Explorez les fonctionnalités de notre application et découvrez comment identifier des fruits en un instant.',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Fruit Classifier Info Section
              Text(
                'Fruit Classifier',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    buildGridItem(Icons.camera_alt, 'Capture', 'Take a picture of a fruit to classify it.', Colors.blue[100]!),
                    buildGridItem(Icons.lightbulb, 'Deep Learning', 'Uses AI to identify fruits with high accuracy.', Colors.red[100]!),
                    buildGridItem(Icons.info, 'How It Works', 'Powered by a TensorFlow model trained on fruit datasets.', Colors.green[100]!),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TensorFlow()),
                        );
                      },
                      child: buildGridItem(Icons.computer, 'TensorFlow', 'Explore TensorFlow view.', Colors.purple[100]!),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Tips Section
              Text(
                'Tips for Best Results',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '• Ensure good lighting when capturing fruit images.\n'
                      '• Avoid blurry or partial images for better accuracy.\n'
                      '• The model recognizes common fruits; unusual items may not be classified.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to create each grid item
  Widget buildGridItem(IconData icon, String title, String subtitle, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.blueGrey[800]),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
