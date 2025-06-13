import 'package:flutter/material.dart';

import '../../model/entities/Event.dart';
import '../screens/single_event_page.dart';

class EventCard extends StatelessWidget {

  final Event event;
  EventCard({super.key, required this.event});


  @override
  Widget build(BuildContext context) {
    TextTheme textStyle = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/event', arguments: event.id),
      child: Card(
        margin: const EdgeInsets.all(8), // Spacing between cards
        elevation: 2, // Adds a shadow effect
        child:  Padding(
            padding: const EdgeInsets.all(10), // Space inside the card
            child: IntrinsicHeight(
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: 'placeholder',
                      // child: Image.asset('assets/placeholder.png',
                      //     width: 60, height: 60),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child:
                          event.imagesSrcs != null && event.imagesSrcs!.isNotEmpty
                              ? Image.network(
                            event.imagesSrcs!.first,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/placeholder.png', width: 60, height: 60);
                            },
                          )
                              : Image.asset('assets/placeholder.png', width: 60, height: 60),

                      ),
                    ), // Image on the left
                    const SizedBox(width: 10), // Spacing between image & text
                
                         Text(event.name, style: textStyle.headlineMedium),
                         Text(event.description, style: textStyle.bodyMedium),
                         Text(event.location?['name'] ?? 'no loc', style: textStyle.labelSmall),
                         Text("Starts: ${event.startDate}", style: textStyle.labelSmall),
                         Text("Attendees: ${event.maxAttendees}", style: textStyle.labelSmall),
                      ],
                
                ),
              ),
            ),
          ),
        ),
    );
  }
}
