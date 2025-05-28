import 'package:the_coterie/model/entities/Event.dart';
import '../services/EventAggregationService.dart';

//used if caching is needed in the future

class EventsRepo{
  final EventAggregationService service = EventAggregationService();
  Future<Event> getAllEvents() => service.getAllEvents();
}