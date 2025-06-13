import 'package:the_coterie/model/entities/Event.dart';
import '../services/events_service.dart';

//used if caching is needed in the future

class EventsRepo {
  final EventsService service = EventsService();

  Future<List<Event>> getAllEvents() async {
    try {
      // return await service.getAllEvents();
      return await service.getMockEvents();
    } catch (e) {
      print('Error fetching events: $e');
      return [];
    }
  }

  Future<Event> getEventById(int eventId) {
    try {
      return service.getEventById(eventId);
    } catch (e) {
      print('Error fetching event by ID: $e');
      return Future.error(e);
    }
  }

}