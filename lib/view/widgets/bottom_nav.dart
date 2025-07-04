import 'package:flutter/material.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    print("BottomNavBar initState called");
    _selectedIndex = 1; // Default to Home
    print("_selectedIndex: $_selectedIndex");
  }

  void changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushReplacementNamed(context, '/favorites');
          print("Case 0: $_selectedIndex");
          break;
        case 1:
          Navigator.pushReplacementNamed(context, '/home');
          print("Case 1: $_selectedIndex");
          break;
        case 2:
          Navigator.pushReplacementNamed(context, '/profile');
          print("Case 2: $_selectedIndex");
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: _selectedIndex,
      indicatorColor: Theme.of(context).colorScheme.primary,
      onDestinationSelected: (index) {
          changeIndex(index);
          print("INDEX: $index");
      },
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.bookmark),
          icon: Icon(Icons.bookmark_border),
          label: 'Saved',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.person_2),
          icon: Icon(Icons.person_2_outlined),
          label: 'Profile',
        ),
      ],
    );
  }
}
