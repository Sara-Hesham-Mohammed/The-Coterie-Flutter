import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    const eventNameStyle = TextStyle(fontSize: 12);

    return Card(
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
              Image.asset('assets/placeholder.png',
                  width: 60, height: 60), // Image on the left
              const SizedBox(width: 10), // Spacing between image & text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // Prevent unnecessary space
                children: [
                  const Text("Event Name", style: eventNameStyle),
                  const Text("Mini Description", style: eventNameStyle),
                  const Text("Location", style: eventNameStyle),
                  const Text("Date", style: eventNameStyle),
                  const Text("Attendees: X", style: eventNameStyle),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
