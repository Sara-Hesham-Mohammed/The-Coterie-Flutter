import 'package:flutter/material.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Column(
        children: [
           TabBar(
            tabs: [
              Tab(text: 'Explore'),
              Tab(text: 'For You'),
            ],
            indicatorColor: Theme.of(context).colorScheme.secondary, // Customize the indicator color
            labelColor: Theme.of(context).colorScheme.secondary, // Customize the selected tab text color
            unselectedLabelColor: Colors.grey, // Customize unselected tab text color
          ),
          Expanded(
            child: TabBarView(
                children: <Widget>[
                  //tab 1
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(child: Placeholder()),
                        Center(child: Placeholder()),
                        Center(child: Placeholder()),
                        Center(child: Placeholder()),
                      ],
                    ),
                  ),
                   // tab 2
                   SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(child: Placeholder()),
                        Center(child: Placeholder()),
                        Center(child: Placeholder()),
                        Center(child: Placeholder()),
                      ],
                    ),
                  )

                ],
                ),
          ),
        ],
      ));
  }
}