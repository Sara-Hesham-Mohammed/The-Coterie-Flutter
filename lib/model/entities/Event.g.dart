// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => Event(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      type: $enumDecodeNullable(_$EventTypeEnumMap, json['type']),
      hostName: json['hostName'] as String?,
      location: (json['location'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toSet(),
      groupsAttending: (json['groupsAttending'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toSet(),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      status: $enumDecodeNullable(_$EventStateEnumMap, json['status']),
      isPaid: json['isPaid'] as bool?,
      price: (json['price'] as num?)?.toDouble(),
      isRecurring: json['isRecurring'] as bool?,
      maxAttendees: (json['maxAttendees'] as num?)?.toInt(),
      imagesSrcs: (json['imagesSrcs'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      rsvps: (json['rsvps'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': _$EventTypeEnumMap[instance.type],
      'hostName': instance.hostName,
      'location': instance.location,
      'tags': instance.tags?.toList(),
      'groupsAttending': instance.groupsAttending?.toList(),
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'status': _$EventStateEnumMap[instance.status],
      'isPaid': instance.isPaid,
      'price': instance.price,
      'isRecurring': instance.isRecurring,
      'maxAttendees': instance.maxAttendees,
      'imagesSrcs': instance.imagesSrcs,
      'rsvps': instance.rsvps,
    };

const _$EventTypeEnumMap = {
  EventType.TBD: 'TBD',
};

const _$EventStateEnumMap = {
  EventState.Upcoming: 'Upcoming',
  EventState.Ongoing: 'Ongoing',
  EventState.Ended: 'Ended',
  EventState.Canceled: 'Canceled',
};
