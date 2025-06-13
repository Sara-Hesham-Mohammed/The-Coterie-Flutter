import '../../model/entities/Event.dart';

abstract class EventState {}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final Event event;
  EventLoaded(this.event);
}

class EventError extends EventState {
  final String message;
  EventError(this.message);
}