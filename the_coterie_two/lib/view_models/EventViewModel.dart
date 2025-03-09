import 'package:flutter/material.dart';
import 'package:the_coterie/model/entites/Event.dart';
import 'package:the_coterie/model/repositories/EventsRepo.dart';

class EventViewModel extends ChangeNotifier{
  EventsRepo repo = EventsRepo();
  String event; //fix this to be the Event entity, like pass all the necessary args and shi


  EventViewModel() : event = EventsRepo().getEvents();

  void update() {
    //change whatever to the event here
    notifyListeners(); // Updates UI
  }

}