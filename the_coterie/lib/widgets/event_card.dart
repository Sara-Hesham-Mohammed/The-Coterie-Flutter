import 'package:flutter/material.dart';
import '../model/entities/Event.dart';
import '../view/single_event_page.dart';

class EventCard extends StatelessWidget {

  final Event event;
  EventCard({super.key, required this.event});


  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => EventPage(),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(8), // Spacing between cards
        elevation: 4, // Adds a shadow effect
        child: SizedBox(
          width: 200, // Set width so cards appear side by side
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(10), // Space inside the card
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'placeholder',
                  child: Image.asset('assets/placeholder.png',
                      width: 60, height: 60),
                ), // Image on the left
                const SizedBox(width: 10), // Spacing between image & text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Prevent unnecessary space
                  children: [
                     Text(event.name, style: textStyle.headlineMedium),
                     Text(event.description, style: textStyle.bodyMedium),
                     Text(event.location, style: textStyle.labelSmall),
                     Text("Starts: ${event.startDate}", style: textStyle.labelSmall),
                     Text("Attendees: ${event.maxAttendees}", style: textStyle.labelSmall),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
