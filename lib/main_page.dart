import 'package:easy_travel/home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        onTap: _onIndexChanged,

        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home), 
            icon: Icon(Icons.home_outlined),
            label: "Home"
            ),

          BottomNavigationBarItem(
            activeIcon: Icon(Icons.favorite),
            icon: Icon(Icons.favorite_outline),
            label: "Favorite",
          ),

          BottomNavigationBarItem(
            activeIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline), 
            label: "Person"
            ),
        ],
      ),
    );
  }

  void _onIndexChanged(value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
