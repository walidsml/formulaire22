import 'package:flutter/material.dart';

class CardsView extends StatelessWidget {
  const CardsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'World Map', // Replace with your desired title
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40), // Adds spacing between title and image
          Image.asset("image/img.png"),
        ],
      ),
    );
  }
}