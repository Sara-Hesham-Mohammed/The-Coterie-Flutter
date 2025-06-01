import 'package:flutter/material.dart';
import 'package:the_coterie/model/entities/Event.dart';
import 'package:the_coterie/model/repositories/EventsRepo.dart';

class EventViewModel extends ChangeNotifier {
  final EventsRepo _repo = EventsRepo();

  // State management properties
  List<Event> _events = [];
  bool _isLoading = false;
  String? _error;

  // Getters
  List<Event> get events => _events;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get hasEvents => _events.isNotEmpty;

  // Constructor - load events on initialization
  EventViewModel() {
    loadEvents();
  }

  // Load all events from repository
  Future<void> loadEvents() async {
    _setLoading(true);
    _setError(null);

    try {
      _events = await _repo.getAllEvents();
      _setError(null);
      print('Successfully loaded ${_events.length} events');
    } catch (e) {
      _setError('Failed to load events: $e');
      _events = [];
      print('Error loading events: $e');
    } finally {
      _setLoading(false);
    }
  }

  // Refresh events (pull-to-refresh functionality)
  Future<void> refreshEvents() async {
    await loadEvents();
  }

  // Get event by ID
  Event? getEventById(int id) {
    try {
      return _events.firstWhere((event) => event.id == id);
    } catch (e) {
      return null;
    }
  }

  // Filter events by name
  List<Event> searchEvents(String query) {
    if (query.isEmpty) return _events;

    return _events.where((event) =>
    event.name.toLowerCase().contains(query.toLowerCase()) ||
        event.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }

  // Add a new event (if you have add functionality)
  Future<void> addEvent(Event event) async {
    try {
      // If your repo has an addEvent method
      // await _repo.addEvent(event);

      // For now, just add to local list
      _events.add(event);
      notifyListeners();
    } catch (e) {
      _setError('Failed to add event: $e');
    }
  }

  // Update an existing event
  Future<void> updateEvent(Event updatedEvent) async {
    try {
      // If your repo has an updateEvent method
      // await _repo.updateEvent(updatedEvent);

      // For now, update local list
      int index = _events.indexWhere((event) => event.id == updatedEvent.id);
      if (index != -1) {
        _events[index] = updatedEvent;
        notifyListeners();
      }
    } catch (e) {
      _setError('Failed to update event: $e');
    }
  }

  // Delete an event
  Future<void> deleteEvent(int eventId) async {
    try {
      // If your repo has a deleteEvent method
      // await _repo.deleteEvent(eventId);

      // For now, remove from local list
      _events.removeWhere((event) => event.id == eventId);
      notifyListeners();
    } catch (e) {
      _setError('Failed to delete event: $e');
    }
  }

  // Private helper methods
  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }

  // Clear error message
  void clearError() {
    _setError(null);
  }

  // Get events by status (if you have status in your Event model)
  List<Event> getEventsByStatus(EventState status) {
    return _events.where((event) => event.status == status).toList();
  }

  // Get upcoming events
  List<Event> getUpcomingEvents() {
    DateTime now = DateTime.now();
    return _events.where((event) =>
    event.startDate != null && event.startDate!.isAfter(now)
    ).toList();
  }

  // Get past events
  List<Event> getPastEvents() {
    DateTime now = DateTime.now();
    return _events.where((event) =>
    event.endDate != null && event.endDate!.isBefore(now)
    ).toList();
  }

}

// TODO: This is a simple main function to demonstrate the usage of EventViewModel. THIS CAUSES WEIRD ERRORS
void main() async {

  EventViewModel viewModel = EventViewModel();

  // Example usage
  await viewModel.loadEvents();
  print('Loaded events: ${viewModel.events.length}');
  print("IN VIEW MODEL");
}
