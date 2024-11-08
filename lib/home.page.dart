import 'package:flutter/material.dart';
import 'package:formulaire22/Screens/cards.view.dart';
import 'package:formulaire22/Screens/home.view.dart';
import 'package:formulaire22/Screens/login.view.dart';
import 'package:formulaire22/Screens/profile.view.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currIndex = 0;

  List<Widget> pages = [HomeView(), LoginView(), CardsView(),Profileview()];

  void ChangePage(int selectIndex){
    setState(() {
      currIndex = selectIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "App",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          backgroundColor: Colors.black,
        ),
        body: SafeArea(child: Padding(padding: EdgeInsets.all(16),
        child: IndexedStack(
          index: currIndex ,
          children:pages,
        ),
        )),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
        currentIndex: currIndex,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.white ,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
        BottomNavigationBarItem(icon: Icon(Icons.map), label: "Cards"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),

      ], onTap: ChangePage,),
    );
  }
}
  