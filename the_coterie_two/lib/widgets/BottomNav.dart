import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/BottomNavProvider.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return BottomNavigationBar(
      currentIndex: bottomNavProvider.selectedIndex,
      onTap: (index) => bottomNavProvider.changeIndex(index),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Browse',
        ),
      ],
    );
  }
}
