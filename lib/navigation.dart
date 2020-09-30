import 'package:flutter/material.dart';
import 'package:yovie_app/main.dart';
import 'package:yovie_app/screens/home.dart';
import 'package:yovie_app/screens/play.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Play(),
    Play(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey[300],
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow, size: 30),
            title: Text('Play'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list, size: 30),
            title: Text('Library'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}