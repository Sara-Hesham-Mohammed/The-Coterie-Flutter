import '../services/EventAggregationService.dart';

class EventsRepo{
  final EventAggregationService service = EventAggregationService();
  String getEvents() => service.fetchEvents();
}