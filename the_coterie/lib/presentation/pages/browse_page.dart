import 'package:flutter/material.dart';
import 'package:the_coterie/presentation/widgets/event_card.dart';

class BrowseSection extends StatelessWidget {
  const BrowseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Browse Events"),
      ),
      body: SubSection(),
    );
  }
}



class SubSection extends StatelessWidget {
  const SubSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Browse"),
        Container(
            height: 125,
            color: Colors.blueAccent,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                EventCard(),
                EventCard(),
                EventCard(),
                EventCard(),
              ],
            ),
          ),
      ],
    );
  }
}
