import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
      currentIndex: index,
      onTap: (int index) { setState((){ this.index = index; }); },
      items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: 'Home',
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.search),
          label: 'Search',
        ),
      ],
    );
  }
}
