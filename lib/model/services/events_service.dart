import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:the_coterie/model/entities/Event.dart';
import 'package:the_coterie/utils/constants.dart';
import '../entities/FilterCategoriesEnum.dart';
import 'package:intl/intl.dart'; // For date parsing


class EventsService {
  String URL = GATEWAY+EVENTS_ENDPOINT;

  //fetch data from API
  Future<List<Event>> getAllEvents() async {
    try{
    print("GETTING EVENTS FROM API");
    final response = await http.get(
      Uri.parse(URL),
    );
    print(response);

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
    }}on SocketException catch (e) {
      print('Network error: $e');
      // Handle offline/connection issues
      throw Exception('Network connection failed. Please check your internet connection.');
    } on http.ClientException catch (e) {
      print('Client error: $e');
      throw Exception('Unable to connect to server. Please try again later.');
    } catch (e) {
      print('Unexpected error: $e');
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<List<Event>> getMockEvents() async {
    final List<Event> mockEvents = [
      Event(
        id: 1,
        name: 'Crowd Gigs By Mohamed Helmy-2nd Show',
        description: 'A fantastic music performance by Mohamed Helmy',
        startDate: DateFormat('MMM d yyyy h:mm a').parse('Jun 15 2023 08:00 PM'),
        endDate: DateFormat('MMM d yyyy h:mm a').parse('Jun 15 2023 10:00 PM'),
        location: {
          'name': 'Theatro Arkan',
          'link': 'N/A',
          // Add any other location fields your model might need
        },
        status: EventState.Upcoming,
        isPaid: true,
        price: 150.0,
        imagesSrcs: ['https://d3vzzcunewy153.cloudfront.net/img/17f95c00-4ab0-492d-94a6-3a647e5ea2fe/5983a4b5fc7cd6d7d1519b5f5d0d05b9.png']
      ),
      Event(
        id: 2,
        name: 'Red Bull Half Court-El Minya',
        description: 'Basketball tournament in El Minya',
        startDate: DateFormat('MMM d yyyy h:mm a').parse('Jun 19 2023 06:00 PM'),
        endDate: DateFormat('MMM d yyyy h:mm a').parse('Jun 19 2023 09:00 PM'),
        location: {
          'name': 'Porto Sporting Club - El Minya',
          'link': 'N/A',
        },
        status: EventState.Upcoming,
        isPaid: false,
        price: 0.0,
        imagesSrcs: ['https://d3vzzcunewy153.cloudfront.net/img/17f95c00-4ab0-492d-94a6-3a647e5ea2fe/e2dfad178c5c710a5058418604c46a5b.png']
      ),
      Event(
        id: 3,
        name: 'Ali Quandil Men First X Theatro Arkan',
        description: 'Stand-up comedy show by Ali Quandil',
        startDate: DateFormat('MMM d yyyy h:mm a').parse('Jun 20 2023 08:00 PM'),
        endDate: DateFormat('MMM d yyyy h:mm a').parse('Jun 20 2023 10:30 PM'),
        location: {
          'name': 'Theatro Arkan',
          'link': 'N/A',
        },
        status: EventState.Upcoming,
        isPaid: true,
        price: 200.0,
        imagesSrcs: ['https://d3vzzcunewy153.cloudfront.net/img/17f95c00-4ab0-492d-94a6-3a647e5ea2fe/fbc64e0bc851690ac5aa8e49db95b859.jpg']
      ),
      // Continue with all other events in the same format...
      Event(
        id: 19,
        name: 'Amr Diab X Monolink X WhoMadeWho',
        description: 'Music concert featuring Amr Diab and international artists',
        startDate: DateFormat('MMM d yyyy h:mm a').parse('Jul 4 2023 09:00 PM'),
        endDate: DateFormat('MMM d yyyy h:mm a').parse('Jul 5 2023 01:00 AM'),
        location: {
          'name': 'Sol Beach',
          'link': 'N/A',
        },
        status: EventState.Upcoming,
        isPaid: true,
        price: 500.0,
        imagesSrcs: ['https://d3vzzcunewy153.cloudfront.net/img/17f95c00-4ab0-492d-94a6-3a647e5ea2fe/a79eb46b319b6be4281ac7272fb1073e.png']
      ),
    ];

    return mockEvents;
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
        return events;
        // return events
        //     .where(
        //         (event) => event.location.toLowerCase() == value.toLowerCase())
        //     .toList();
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
