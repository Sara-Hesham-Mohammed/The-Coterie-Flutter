import 'package:flutter/material.dart';

import 'bottom_nav.dart';

class Skeleton extends StatelessWidget {
  final Widget bodyWidget;
  final String txt;
  const Skeleton({super.key, required this.bodyWidget, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(txt),
      ),
      body: bodyWidget,
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
