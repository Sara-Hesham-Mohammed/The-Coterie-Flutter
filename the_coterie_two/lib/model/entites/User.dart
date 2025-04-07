import './Group.dart';
import './Person.dart';
import './Tag.dart';
import './Event.dart';

class User extends Person {
  final int userID;
  final Set<Tag> tags;
  final Set<User> friends;
  final Set<Event> eventsAttended;
  final Set<Event> savedEvents;
  final Set<Group> groups;

  User({
    required this.userID,
    required this.tags,
    required String name,
    required DateTime dateOfBirth,
    required String gender,
    required String address,
    required String phoneNumber,
    required String email,
    Set<User>? friends,
    Set<Event>? eventsAttended,
    Set<Event>? savedEvents,
    Set<Group>? groups,
  })  : friends = friends ?? {},
        eventsAttended = eventsAttended ?? {},
        savedEvents = savedEvents ?? {},
        groups = groups ?? {},
        super(
        name: name,
        dateOfBirth: dateOfBirth,
        gender: gender,
        address: address,
        phoneNumber: phoneNumber,
        email: email,
      );

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userID: json['userID'],
      tags: (json['tags'] as List<dynamic>?)
        ?.map((tag) => Tag.fromJson(tag))
        .toSet() ?? {},
      name: json['name'],
      dateOfBirth: DateTime.parse(json['dateOfBirth']),
      gender: json['gender'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      friends: (json['friends'] as List<dynamic>?)
          ?.map((f) => User.fromJson(f))
          .toSet(),
      eventsAttended: (json['eventsAttended'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e))
          .toSet(),
      savedEvents: (json['savedEvents'] as List<dynamic>?)
          ?.map((e) => Event.fromJson(e))
          .toSet(),
      groups: (json['groups'] as List<dynamic>?)
          ?.map((g) => Group.fromJson(g))
          .toSet(),
    );
  }

}