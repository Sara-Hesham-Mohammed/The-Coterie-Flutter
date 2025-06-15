// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      userID: (json['userID'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toSet(),
      name: json['name'] as String,
      dateOfBirth: DateTime.parse(json['dateOfBirth'] as String),
      gender: json['gender'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      languages:
          (json['languages'] as List<dynamic>).map((e) => e as String).toList(),
      countryOfOrigin: json['countryOfOrigin'] as String,
      friends: (json['friends'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toSet(),
      eventsAttended: (json['eventsAttended'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toSet(),
      savedEvents: (json['savedEvents'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toSet(),
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toSet(),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'dateOfBirth': instance.dateOfBirth.toIso8601String(),
      'gender': instance.gender,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'userID': instance.userID,
      'tags': instance.tags.map((e) => e.toJson()).toList(),
      'friends': instance.friends.map((e) => e.toJson()).toList(),
      'eventsAttended': instance.eventsAttended.map((e) => e.toJson()).toList(),
      'savedEvents': instance.savedEvents.map((e) => e.toJson()).toList(),
      'groups': instance.groups.map((e) => e.toJson()).toList(),
      'languages': instance.languages,
      'countryOfOrigin': instance.countryOfOrigin,
    };
