import 'package:flutter/material.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Event(title: 'Event Page'),
    );
  }
}


  class Event extends StatelessWidget {
  Event({super.key, required this.title});

  final String title;
  String _var = "Smth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //replace all with stuff that'll come from API
          Text('Event Title'),
          Text('Event $_var',
              style: Theme.of(context).textTheme.headlineMedium,),
          Text('Event Details'),

        ],
      ),
    );
  }
  }
