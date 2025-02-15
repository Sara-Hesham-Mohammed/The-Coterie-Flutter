import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(// lazm material widget, layout widgets and such cause an error idk why?
        appBar: AppBar(
          title: const Text('Events Page'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'Browse'),
              Tab(text: 'For You'),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(child: Placeholder()),
            Center(child: Placeholder()),
          ],
        ),
      ),
    );
  }
}