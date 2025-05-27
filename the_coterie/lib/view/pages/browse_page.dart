import 'package:flutter/material.dart';
import 'package:the_coterie/widgets/event_card.dart';
import 'package:the_coterie/widgets/skeleton.dart';
import '../../model/entities/Event.dart';
import '../../widgets/search_bar.dart';

class BrowseSection extends StatelessWidget {
  const BrowseSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeleton(bodyWidget: SubSection(), showAppBars: true, txt: "Browse Page");
  }
}



class SubSection extends StatefulWidget {

  SubSection({super.key});

  @override
  State<SubSection> createState() => _SubSectionState();
}

class _SubSectionState extends State<SubSection> {
  List<Event> events = [];

  @override
  Widget build(BuildContext context) {
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
                return EventCard(
                );
              },
            ),
          ),
      ],
    );
  }
}
