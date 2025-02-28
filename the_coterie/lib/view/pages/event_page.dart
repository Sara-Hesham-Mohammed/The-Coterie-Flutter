import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/EventViewModel.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Event(); // Removed extra MaterialApp
  }
}

class Event extends StatelessWidget {
  Event({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventViewModel(),
      child: Scaffold(
        body: Consumer<EventViewModel>(
          builder: (_, viewModel, __) => Center(
            child: Column(
              children: [
                EventTitle(title: "Events: ${viewModel.event}"),
                ImageScroll(),
              ],
            ),
          ),
        ),
      ),
    );
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
  String _var = "Smth";

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
            'Event $_var',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text('Event Details'),
        ],
      ),
    );
  }
}
