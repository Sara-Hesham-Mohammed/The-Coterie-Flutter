import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:the_coterie/model/entities/Event.dart';
import 'package:the_coterie/model/repositories/events_repo.dart';

class EventViewModel extends ChangeNotifier {
  bool _isLoading = false;
  final EventsRepo _repo = EventsRepo();
  final List<Event> _events = [];

  UnmodifiableListView<Event> get events => UnmodifiableListView(_events);

  bool get isLoading => _isLoading;

  Future<List<Event>> _loadEvents() async {
    _isLoading = true;
    try {
      // final List<Event> eventsResult = await _repo.getAllEvents();
      // if (eventsResult.isEmpty) {
      //   throw Exception('No events found');
      // } else {
      //   _events.addAll(eventsResult);
      //   return eventsResult;
      // }
      //
      final List<Event> eventsResult = await _repo.getAllEvents();
      if (eventsResult.isEmpty) {
        throw Exception('No events found');
      } else {
        _events.addAll(eventsResult);
        return eventsResult;
      }
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<List<Event>> loadEvents() => _loadEvents();

  //TODO: make these for admins only
  void addEvent(Event newEvent) {
    _events.add(newEvent); // Modify the private list
    notifyListeners(); // Update UI
  }

  void removeEvent(int eventId) {
    _events.removeWhere((event) => event.id == eventId);
    notifyListeners();
  }

// Mock data for testing
  final List<Map<String, dynamic>> _mockEventData = [
    {
      'title': 'Crowd Gigs By Mohamed Helmy-2nd Show',
      'date': 'Jun 15 | 08:00 PM',
      'location': {'name': 'Theatro Arkan', 'link': 'N/A'}
    },
    {
      'title': 'Red Bull Half Court-El Minya',
      'date': 'Jun 19 | 06:00 PM',
      'location': {'name': 'Porto Sporting Club - El Minya', 'link': 'N/A'}
    },
    {
      'title': 'Ali Quandil Men First X Theatro Arkan',
      'date': 'Jun 20 | 08:00 PM',
      'location': {'name': 'Theatro Arkan', 'link': 'N/A'}
    },
    {
      'title': 'Last Seen Live Showcase Laii Album Launch',
      'date': 'Jun 21 | 08:00 PM',
      'location': {'name': 'Cairo Jazz Club 610', 'link': 'N/A'}
    },
    {
      'title': 'Ali Quandil Interactive And Stand Up Comedy Show',
      'date': 'Jun 24 | 09:00 PM',
      'location': {'name': 'Boom Room, Open Air Mall, Madinaty', 'link': 'N/A'}
    },
    {
      'title': 'Red Bull Half Court-Cairo',
      'date': 'Jun 27 | 06:00 PM',
      'location': {'name': 'Shooting Club - Kattameya', 'link': 'N/A'}
    },
    {
      'title': '&ME',
      'date': 'Aug 08 | 09:00 PM',
      'location': {'name': 'Sol Beach', 'link': 'N/A'}
    },
    {
      'title': 'The Comedy Bunch',
      'date': 'Jun 17 | 08:00 PM',
      'location': {'name': 'Cairo Jazz Club 610', 'link': 'N/A'}
    },
    {
      'title': 'Ziad Moussa | Sainte Vie | Mohasseb B2B Ashmawy',
      'date': 'Jun 19 | 08:00 PM',
      'location': {'name': 'Cairo Jazz Club 610', 'link': 'N/A'}
    },
    {
      'title': 'Rodge | Zabadi Khalat',
      'date': 'Jun 20 | 09:00 PM',
      'location': {'name': 'Cairo Jazz Club 610', 'link': 'N/A'}
    },
    {
      'title': '"ADHD" Interactive Comedy Show By Mahmoud Konafa',
      'date': 'Jun 23 | 08:00 PM',
      'location': {'name': 'Rawabet Art Space', 'link': 'N/A'}
    },
    {
      'title': 'Lena Chamamyan - Mates',
      'date': 'Jun 26 | 08:00 PM',
      'location': {'name': 'Theatro Arkan', 'link': 'N/A'}
    },
    {
      'title': 'ZED PARK',
      'date': '',
      'location': {'name': 'Zed Park, Elsheikh Zayed', 'link': 'N/A'}
    },
    {
      'title': 'Red Bull Half Court',
      'date': '19, 21 and 27th of June 2025',
      'location': {'name': 'El Minya - Alexandria - Cairo', 'link': 'N/A'}
    },
    {
      'title': 'Ski Egypt\'s 4x4 Snow Challenge Event – The 2nd Edition',
      'date': 'Jun 20 | 05:00 PM',
      'location': {'name': 'Ski Egypt at Mall of Egypt', 'link': 'N/A'}
    },
    {
      'title': 'Red Bull Half Court-Alexandria',
      'date': 'Jun 21 | 06:00 PM',
      'location': {'name': 'Alexandria Sporting Club', 'link': 'N/A'}
    },
    {
      'title': 'Every Brilliant Thing',
      'date': 'June 24 and 25 | 8:00 PM',
      'location': {'name': 'Rawabet Art Space', 'link': 'N/A'}
    },
    {
      'title': 'Jeff Dunham - Artificial Intelligence',
      'date': 'Jun 26 | 09:00 PM',
      'location': {'name': 'Drama Hall', 'link': 'N/A'}
    },
    {
      'title': 'Amr Diab X Monolink X WhoMadeWho',
      'date': 'Jul 04 | 09:00 PM',
      'location': {'name': 'Sol Beach', 'link': 'N/A'}
    }
  ];
}