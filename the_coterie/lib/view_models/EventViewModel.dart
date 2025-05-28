import 'package:flutter/material.dart';
import 'package:the_coterie/model/entities/Event.dart';
import 'package:the_coterie/model/repositories/EventsRepo.dart';

class EventViewModel extends ChangeNotifier{
  EventsRepo repo = EventsRepo();
  Future<Event> event; //fix this to be the Event entity, like pass all the necessary args and shi


  EventViewModel() : event = EventsRepo().getAllEvents();

  void update() {
    //change whatever to the event here
    notifyListeners(); // Updates UI
  }

}