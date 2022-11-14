// ignore_for_file: prefer_const_constructors

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:gamify/Screens/profile/profile.dart';

import 'package:gamify/dummypage.dart';
import 'package:gamify/live/footballapp.dart';

class NavBar extends StatefulWidget {
  final String data;
  const NavBar({Key? key, required this.data}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late String _data;

  @override
  void initState() {
    _data = widget.data;
    super.initState();
  }

  int currentIndex = 0;
  final List<Widget> _children = [
    DummyPage1(),
    FootballApp(),
    ProfileScreen(),
    DummyPage1(),

    // TableScreen(code: _data),
    // MainPage(),
    // UpdatePage(),
    // MainPage(),

    // TableScreen(code: code),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.list_alt_sharp),
            title: Text('Table'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.greenAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.greenAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.greenAccent,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.content_paste_go_sharp),
            title: Text('Past Matches'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
