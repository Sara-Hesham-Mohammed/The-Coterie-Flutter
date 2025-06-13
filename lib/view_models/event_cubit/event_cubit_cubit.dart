import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/repositories/events_repo.dart';
import 'event_cubit_state.dart';

class EventCubit extends Cubit<EventState> {
  final EventsRepo eventRepository;

  EventCubit(this.eventRepository) : super(EventInitial());

  void loadEvent(int eventId) async {
    try {
      emit(EventLoading());
      final event = await eventRepository.getEventById(eventId);
      emit(EventLoaded(event));
    } catch (e) {
      emit(EventError(e.toString()));
    }
  }

  void clearEvent() {
    emit(EventInitial());
  }
}
