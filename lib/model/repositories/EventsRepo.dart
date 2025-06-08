import 'package:the_coterie/model/entities/Event.dart';
import '../services/events_service.dart';

//used if caching is needed in the future

class EventsRepo {
  final EventsService service = EventsService();

  Future<List<Event>> getAllEvents() async {
    try {
      return await service.getAllEvents();
    } catch (e) {
      print('Error fetching events: $e');
      return [];
    }
  }

}