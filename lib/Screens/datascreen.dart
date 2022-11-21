// ignore_for_file: prefer_const_constructors

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:gamify/Screens/TableScreen.dart';
import 'package:gamify/Screens/profile/profile.dart';
import 'package:gamify/live/footballapp.dart';
import 'package:gamify/live/pastmatches.dart';

class NavBar extends StatefulWidget {
   

   NavBar({Key? key,  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late String _data;

  @override
  void initState() {
   
    super.initState();
  }

  int currentIndex = 0;
  final List<Widget> _children = [
    TableScreen(code: 'PL'),

    FootballApp(),
    ProfileScreen(),
    PastMatches(),
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
