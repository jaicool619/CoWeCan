import 'package:CoWeCan/donor/banner.dart';
import 'package:CoWeCan/excersie/exerciseNyoga.dart';
import 'package:CoWeCan/live/screens/tracker.dart';
import 'package:CoWeCan/screens/home/home.dart';
import 'package:CoWeCan/widgets/mainly.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex = 0;
   List<Widget> _pages = [HomeScreen(), New(), YogaExercise(),Tracker()];
   int f=0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Donor',
      style: optionStyle,
    ),
    Text(
      'Fitness',
      style: optionStyle,
    ),
    Text(
      'Stats',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(width: 40,
      decoration: BoxDecoration(
         
        image: DecorationImage(
      image:f==0? AssetImage("assets/images/bg.png"):f==1?AssetImage('assets/images/donor.gif'):f==2?AssetImage('assets/images/breathe.gif'):AssetImage("assets/images/walking.gif"),
      fit: BoxFit.cover,
    ),
        borderRadius: BorderRadius.circular(20)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
       
        body: _pages[_selectedIndex],
        
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
 
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6),
            child: GNav(
              rippleColor: Colors.grey[300],
              hoverColor: Colors.grey[100],
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100],
              color: Colors.black,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  backgroundColor: Colors.blue,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.heartAlt,
                  text: 'Donor',
                  padding: EdgeInsets.all(8),
                  backgroundColor: Colors.red,
                ),
                GButton(
                  icon: LineIcons.dumbbell,
                  text: 'Fitness',
                  backgroundColor: Colors.yellow,
                ),
                GButton(
                  icon: LineIcons.database,
                  backgroundColor: Colors.green,

                  text: 'Stats',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  f=index;
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}