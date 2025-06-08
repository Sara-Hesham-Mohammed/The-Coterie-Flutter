import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:the_coterie/model/entities/Event.dart';
import 'package:the_coterie/model/repositories/EventsRepo.dart';

class EventViewModel extends ChangeNotifier {
  EventViewModel({
    required EventsRepo repo,
  }) : _repo = repo;

  bool _isLoading = false;
  final EventsRepo _repo;
  List<Event> _events = [];

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

// TODO: This is a simple main function to demonstrate the usage of EventViewModel. THIS CAUSES WEIRD ERRORS
// void main() async {
//   EventViewModel viewModel = EventViewModel(repo: null);
//
//   // Example usage
//   await viewModel.loadEvents();
//   print('Loaded events: ${viewModel.events.length}');
//   print("IN VIEW MODEL");
// }
