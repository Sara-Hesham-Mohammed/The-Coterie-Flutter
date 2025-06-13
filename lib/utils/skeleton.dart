import 'package:flutter/material.dart';

import '../view/widgets/location_picker_btn.dart';

class Skeleton extends StatefulWidget {
  final Widget bodyWidget;
  final String currentRoute;

  const Skeleton({
    Key? key,
    required this.bodyWidget,
    required this.currentRoute,
  }) : super(key: key);

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  int _selectedIndex = 0;

  final List<String> _routes = ['/favorites', '/home', '/profile'];

  @override
  void initState() {
    super.initState();
    print("Skeleton initState called");
    _selectedIndex = _routes.indexOf(widget.currentRoute);
    if (_selectedIndex == -1) _selectedIndex = 1; // Default to home if route not found
    print("_selectedIndex: $_selectedIndex");
  }

  void _changeIndex(int index) {
    if (index != _selectedIndex) {
      print("Navigating to: ${_routes[index]}");
      Navigator.pushReplacementNamed(context, _routes[index]);
    }
  }

  String _getTitle() {
    switch (widget.currentRoute) {
      case '/favorites':
        return 'Saved Events';
      case '/home':
        return 'The Coterie';
      case '/profile':
        return 'Profile';
      default:
        return 'The Coterie';
    }
  }

  @override
  Widget build(BuildContext context) {
    String? _selectedLocation;

    TextStyle titleStyle = Theme.of(context).textTheme.headlineLarge!.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Text(_getTitle(),
          style: titleStyle,
        ),
        actions: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              LocationPickerButton(
                selectedLocation: _selectedLocation,
                onLocationSelected: (location) {
                  setState(() {
                    _selectedLocation = location.toString();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Selected: $_selectedLocation')),
                  );
                },
              ),
              Text("Cairo, Egypt", style: TextStyle(fontSize: 10),)
            ],
          ),
        ],
      ),
      body: widget.bodyWidget,
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _selectedIndex,
        indicatorColor: Theme.of(context).colorScheme.primary,
        onDestinationSelected: (index) {
          _changeIndex(index);
          print("Selected INDEX: $index");
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
      ),
    );
  }
}
