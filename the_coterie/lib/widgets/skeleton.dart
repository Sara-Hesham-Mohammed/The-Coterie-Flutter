import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/BottomNavProvider.dart';
import 'bottom_nav.dart';

class Skeleton extends StatefulWidget {
  final Widget bodyWidget;
  final bool showAppBars;
  String? txt;
  Skeleton({super.key, required this.bodyWidget, required this.showAppBars,this.txt});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return widget.showAppBars ? Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.txt!),
      ),
      body: widget.bodyWidget,
      bottomNavigationBar: BottomNavBar(bottomNavProvider: bottomNavProvider),
    ):
    Scaffold(
      body: widget.bodyWidget,
    );
  }
}
