import 'package:flutter/material.dart';
import 'package:formulaire22/Screens/cards.view.dart';
import 'package:formulaire22/Screens/profile.view.dart';
import 'package:formulaire22/Screens/home.view.dart';
import 'package:formulaire22/Screens/login.view.dart';
import 'package:firebase_auth/firebase_auth.dart'; // For Firebase authentication
import 'package:firebase_storage/firebase_storage.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex = 0;
  String? profilePictureUrl;
  User? user = FirebaseAuth.instance.currentUser;

  List<Widget> pages = [
    HomeView(),
    LoginView(),
    CardsView(),
    Profileview(),
  ];

  @override
  void initState() {
    super.initState();
    _fetchProfilePicture();
  }

  Future<void> _fetchProfilePicture() async {
    try {
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profile_pictures/${user!.uid}.jpg');
      final url = await storageRef.getDownloadURL();
      setState(() {
        profilePictureUrl = url;
      });
    } catch (e) {
      print("Error fetching profile picture: $e");
    }
  }

  void changePage(int selectedIndex) {
    setState(() {
      currIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fruit Classifier",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: IndexedStack(
            index: currIndex,
            children: pages,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.white,
        onTap: changePage,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
          const BottomNavigationBarItem(icon: Icon(Icons.map), label: "Cards"),
          BottomNavigationBarItem(
            icon: profilePictureUrl != null
                ? CircleAvatar(
              backgroundImage: NetworkImage(profilePictureUrl!),
              radius: 12, // Adjust size for the bottom navigation bar
            )
                : const Icon(Icons.person), // Fallback icon
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
