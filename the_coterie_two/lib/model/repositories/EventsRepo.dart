import 'package:the_coterie/model/entities/Event.dart';

import '../services/EventAggregationService.dart';

class EventsRepo{
  final EventAggregationService service = EventAggregationService();
  Future<Event> getEvents() => service.fetchEvents();
}