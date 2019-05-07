import 'package:flutter/material.dart';
import 'home_gif_page.dart';
import '../widgets/placeholder.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    PlaceholderWidget(Colors.black),
    HomeGifPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gif),
            title: Text('Giphy?'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int _index) {
    setState(() {
      _currentIndex = _index;
    });
  }
}
