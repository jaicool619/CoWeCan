
import 'package:attendance/screens/home/home.dart';
import 'package:attendance/screens/home/sleep.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
  
}

class _NavState extends State<Nav> {
  @override
  var _current = 0;
  List<Widget> _pages = [Sleep(), Sleep(), Home()];
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //elevation: 8,
        currentIndex: _current,
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 15,
        //selectedIconTheme: IconThemeData(size: 35),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {});
          _current = index;
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
                size: 40,
              ),
              label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Chill'),
        ],
      ),
      body: _pages[_current],
    );
  }
}
