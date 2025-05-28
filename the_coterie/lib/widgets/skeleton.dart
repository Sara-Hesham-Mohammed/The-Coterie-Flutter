import 'package:flutter/material.dart';

import 'bottom_nav.dart';

class Skeleton extends StatelessWidget {
  static final BottomNavBar _sharedBottomNav = const BottomNavBar();
  final Widget bodyWidget;
  final bool showAppBars;
  String? txt;
  Skeleton({super.key, required this.bodyWidget, required this.showAppBars,this.txt});

  @override
  Widget build(BuildContext context) {
    return showAppBars ? Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(txt!),
      ),
      body: bodyWidget,
      bottomNavigationBar: _sharedBottomNav,
    ):
    Scaffold(
      body: bodyWidget,
    );
  }
}
