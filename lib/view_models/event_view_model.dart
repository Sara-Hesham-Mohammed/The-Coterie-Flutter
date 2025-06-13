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
}