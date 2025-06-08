import './Tag.dart';
import './Group.dart';

// eventState Enum
enum EventState { Upcoming, Ongoing, Ended, Canceled }
enum EventType { TBD }

// event Model
class Event {
  final int id; // Changed from eventID to match DTO
  final String name; // Changed from eventTitle to match DTO
  final String description; // Changed from eventDescription to match DTO
  final EventType? type; // Made optional since DTO doesn't have this
  final String? hostName; // Made optional since DTO doesn't have this
  final dynamic location; // Changed to dynamic to match LocationDTO structure
  final Set<Tag>? tags; // Made optional since DTO doesn't have this
  final Set<Group>? groupsAttending; // Made optional since DTO doesn't have this
  final DateTime? startDate; // Changed from startTime and made nullable to match DTO
  final DateTime? endDate; // Changed from endTime and made nullable to match DTO
  final EventState? status; // Made optional since DTO doesn't have this
  final bool? isPaid; // Made optional since DTO doesn't have this
  final double? price; // Made optional since DTO doesn't have this
  final bool? isRecurring; // Made optional since DTO doesn't have this
  final int? maxAttendees; // Made optional since DTO doesn't have this

  Event({
    required this.id,
    required this.name,
    required this.description,
    this.type,
    this.hostName,
    this.location,
    this.tags,
    this.groupsAttending,
    this.startDate,
    this.endDate,
    this.status,
    this.isPaid,
    this.price,
    this.isRecurring,
    this.maxAttendees,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      type: json['type'] != null
          ? EventType.values.firstWhere(
            (e) => e.toString().split('.').last.toLowerCase() ==
            json['type'].toString().toLowerCase(),
        orElse: () => EventType.TBD,
      )
          : null,
      hostName: json['hostName'],
      location: json['location'], // This will be the LocationDTO object
      tags: (json['tags'] as List<dynamic>?)
          ?.map((tag) => Tag.fromJson(tag))
          .toSet(),
      groupsAttending: (json['groupsAttending'] as List<dynamic>?)
          ?.map((group) => Group.fromJson(group))
          .toSet(),
      startDate: json['startDate'] != null
          ? DateTime.parse(json['startDate'])
          : null,
      endDate: json['endDate'] != null
          ? DateTime.parse(json['endDate'])
          : null,
      status: json['status'] != null
          ? EventState.values.firstWhere(
            (e) => e.toString().split('.').last.toLowerCase() ==
            json['status'].toString().toLowerCase(),
        orElse: () => EventState.Upcoming,
      )
          : null,
      isPaid: json['isPaid'],
      price: json['price'] != null ? (json['price'] as num).toDouble() : null,
      isRecurring: json['isRecurring'],
      maxAttendees: json['maxAttendees'],
    );
  }
}