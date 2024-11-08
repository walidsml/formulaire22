import 'package:flutter/material.dart';

class Profileview extends StatelessWidget {
  const Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage("image/Avatar.png"),
          ),
          SizedBox(height: 30,
          ),
          Text("walid Smali",
            style: Theme.of(context).textTheme.displayLarge),
          SizedBox(height: 30),
          Text("walid@gmail.com",
              style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 20,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
            onPressed: (){},
            child: Text("Modfier"),
            
          )

        ],
      ),
    );
  }
}
