import './Tag.dart';
import './Group.dart';

// eventState Enum
enum EventState { Upcoming, Ongoing, Ended, Canceled }

// event Model
class Event {
  final int eventID;
  final String eventTitle;
  final String eventDescription;
  final String hostName;
  final String location;
  final Set<Tag> tags;
  final Set<Group> groupsAttending;
  final DateTime startTime;
  final DateTime endTime;
  final EventState status;
  final bool isPaid;
  final double price;
  final bool isRecurring;
  final int maxAttendees;

  Event({
    required this.eventID,
    required this.eventTitle,
    required this.eventDescription,
    required this.hostName,
    required this.location,
    required this.tags,
    required this.groupsAttending,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.isPaid,
    required this.price,
    required this.isRecurring,
    required this.maxAttendees,
  });

}