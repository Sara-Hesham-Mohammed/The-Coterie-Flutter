import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_models/event_view_model.dart';

class EventPage extends StatelessWidget {
  EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

class ImageScroll extends StatelessWidget {
  ImageScroll({super.key});

  @override
  Widget build(BuildContext context) {
    const img = Image(image: AssetImage('assets/placeholder.png'));

    const images = [img, img, img, img];

    return SizedBox(
      height: 250, // Ensure ListView has a height
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: images,
      ),
    );
  }
}

class EventTitle extends StatelessWidget {
  EventTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            'Event Title',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'Event',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text('Event Details'),
        ],
      ),
    );
  }
}
