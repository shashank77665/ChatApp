import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:chatapp/call.dart';
import 'package:chatapp/chat.dart';
import 'package:chatapp/friends.dart';
import 'package:chatapp/settings.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> NavigationPages = [Chat(), Friends(), Call(), Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        showInactiveTitle: false,
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        iconSize: 20,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text('Chat'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.people),
            title: Text('Friends'),
            activeColor: Colors.purpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.call),
            title: Text(
              'Calls',
            ),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: SafeArea(child: NavigationPages[_currentIndex]),
    );
  }
}
