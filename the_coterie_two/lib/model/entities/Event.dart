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

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      eventID: json['eventID'],
      eventTitle: json['eventTitle'],
      eventDescription: json['eventDescription'],
      hostName: json['hostName'],
      location: json['location'],
      tags: (json['tags'] as List<dynamic>?)
          ?.map((tag) => Tag.fromJson(tag))
          .toSet() ?? {},
      groupsAttending: (json['groupsAttending'] as List<dynamic>?)
          ?.map((group) => Group.fromJson(group))
          .toSet() ?? {},
      startTime: DateTime.parse(json['startTime']),
      endTime: DateTime.parse(json['endTime']),
      status: EventState.values.firstWhere(
        //convert enum to string and compare with json
            (e) => e.toString().split('.').last.toLowerCase() ==
            json['status'].toString().toLowerCase(),
        orElse: () => EventState.Upcoming, // fallback
      ),
      isPaid: json['isPaid'],
      price: (json['price'] as num).toDouble(),
      isRecurring: json['isRecurring'],
      maxAttendees: json['maxAttendees'],
    );
  }


}