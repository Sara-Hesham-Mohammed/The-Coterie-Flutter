import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_coterie/model/entities/Event.dart';
import '../entities/FilterCategoriesEnum.dart';

class EventsService {
  String URL = 'http://localhost:3000/events/all-events/IE';

  //fetch data from API
  Future<List<Event>> getAllEvents() async {
    final response = await http.get(
      Uri.parse(URL),
    );

    if (response.statusCode == 200) {
      dynamic jsonData = jsonDecode(response.body);

      if (jsonData is List) {
        // Handle array of events
        print('Received array of ${jsonData.length} events');

        List<Event> events = jsonData
            .map((eventJson) => Event.fromJson(eventJson as Map<String, dynamic>))
            .toList();

        print('Successfully parsed ${events.length} events');
        for (var event in events) {
          print('Event: ${event.name} (ID: ${event.id})');
        }

        return events;

      } else if (jsonData is Map<String, dynamic>) {
        // Handle single event - wrap it in a list
        print('Received single event');

        Event event = Event.fromJson(jsonData);
        print('Successfully parsed event: ${event.name} (ID: ${event.id})');

        return [event]; // Return as a list with one item

      } else {
        print('Unexpected JSON structure: ${jsonData.runtimeType}');
        throw Exception('Unexpected JSON structure: ${jsonData.runtimeType}');
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Events. Status code: ${response.statusCode}');
    }
  }
  //fetch data from API with id
  Future<Event> getEventById(int id) async {
    final response = await http.get(
      Uri.parse('$URL/events/$id'),
    );

    if (response.statusCode == 200) {
      return Event.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load Event with id $id');
    }
  }

  List<Event> filterEventsBy(List<Event> events, FilterCategories category, String value) {
    switch (category) {
      case FilterCategories.Date:
        DateTime date = DateTime.parse(value);
        return events
            .where(
              (event) =>
                  event.startDate?.year == date.year &&
                  event.startDate?.month == date.month &&
                  event.startDate?.day == date.day,
            )
            .toList();
      case FilterCategories.Location:
        return events
            .where(
                (event) => event.location.toLowerCase() == value.toLowerCase())
            .toList();
      case FilterCategories.Tags:
        return events
            .where((event) =>
                event.tags?.any((tag) =>
                    tag.tagName.toLowerCase() == value.toLowerCase()) ??
                false)
            .toList();
      case FilterCategories.MinAttendees:
        int minAttendees = int.parse(value);
        return events
            .where((event) => event.groupsAttending!.length >= minAttendees)
            .toList();

      case FilterCategories.MaxAttendees:
        int maxAttendees = int.parse(value);
        return events
            .where((event) => event.groupsAttending!.length <= maxAttendees)
            .toList();
      case FilterCategories.EventType:
        return events
            .where((event) =>
                event.type.toString().toLowerCase() == value.toLowerCase())
            .toList();
      case FilterCategories.IsPaid:
        bool isPaid = value.toLowerCase() == 'true';
        return events.where((event) => event.isPaid == isPaid).toList();
    }
  }

  Future<void> deleteEvent(int id) async {
    final response = await http.delete(
      Uri.parse('$URL/events/$id'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete Event with id $id');
    }
  }

  void main() async {
    getAllEvents();
  }
}
