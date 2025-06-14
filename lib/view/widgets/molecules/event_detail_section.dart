
import 'package:flutter/material.dart';

import '../../../model/entities/Event.dart';
import 'event_info_card.dart';

class EventDetailsSection extends StatelessWidget {
  final Event event;

  const EventDetailsSection({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event title and category
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.name ?? 'Event Title',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          event.type?.toString() ?? 'Event',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Add to favorites
                  },
                  icon: const Icon(Icons.favorite_border),
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Event info cards - Fixed: Removed problematic Expanded wrapper
            EventInfoCard(
              icon: Icons.calendar_today,
              title: 'Date',
              subtitle: event.startDate?.toString() ?? 'TBA',
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: EventInfoCard(
                    icon: Icons.location_on,
                    title: 'Location',
                    subtitle: event.location?.toString() ?? 'TBA',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: EventInfoCard(
                    icon: Icons.people,
                    title: 'Attendees',
                    subtitle: '${event.groupsAttending ?? 0} going',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Description section
            Text(
              'About This Event',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              event.description ?? 'No description available for this event.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                height: 1.6,
              ),
            ),

            const SizedBox(height: 24),

            // Action buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Share functionality
                    },
                    icon: const Icon(Icons.share),
                    label: const Text('Share'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {
                      // Add to calendar
                    },
                    icon: const Icon(Icons.calendar_month),
                    label: const Text('Add to Calendar'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 100), // Space for FAB
          ],
        ),
      ),
    );
  }
}
