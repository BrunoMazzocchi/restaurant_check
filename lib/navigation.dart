import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_check/views/main_app.dart';
import 'package:restaurant_check/views/profile.dart';
import 'package:restaurant_check/views/settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  // Asigna el estado  de la barra de navegación
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetsChildren = [
      const MainApp(),
      const Profile(),
      const Settings(),
      const Settings(),
    ];

    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedIndex: _currentIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(CupertinoIcons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.profile_circled),
            label: "Profile",
          ),
          NavigationDestination(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
      body: <Widget>[
        const MainApp(),
        const Profile(),
        const Settings(),
        const Settings(),
      ][_currentIndex],
    );
  }
}
