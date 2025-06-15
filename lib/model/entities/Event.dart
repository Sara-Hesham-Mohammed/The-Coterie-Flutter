import 'package:json_annotation/json_annotation.dart';
import './Tag.dart';
import './Group.dart';
import './User.dart';

part 'Event.g.dart';

// eventState Enum
enum EventState { Upcoming, Ongoing, Ended, Canceled }
enum EventType { TBD } // concert, conference, workshop etc.

// event Model
@JsonSerializable()
class Event {
  final int id;
  final String name;
  final String description;
  final EventType? type;
  final String? hostName;
  final Map<String, String>? location;
  final Set<Tag>? tags;
  final Set<Group>? groupsAttending;
  final DateTime? startDate;
  final DateTime? endDate;
  final EventState? status;
  final bool? isPaid;
  final double? price;
  final bool? isRecurring;
  final int? maxAttendees;
  final List<String>? imagesSrcs;
  final List<User>? rsvps;

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
    this.imagesSrcs,
    this.rsvps,
  });

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}