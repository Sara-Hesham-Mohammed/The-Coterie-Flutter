import 'package:flutter/material.dart';
import 'package:the_coterie/widgets/event_card.dart';
import '../model/entities/Event.dart';
import '../widgets/search_bar.dart';

class BrowseSection extends StatefulWidget {
  const BrowseSection({super.key});

  @override
  State<BrowseSection> createState() => _BrowseSectionState();
}

class _BrowseSectionState extends State<BrowseSection> {
  @override
  Widget build(BuildContext context) {
    List<Event> events = [];
    return Column(
      children: [
        Search(),
        Text("Browse"),
        Container(
          height: 125,
          color: Colors.blueAccent,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: events.length,
            itemBuilder: (BuildContext context, int index) {
              return EventCard();
            },
          ),
        ),
      ],
    );
  }
}
