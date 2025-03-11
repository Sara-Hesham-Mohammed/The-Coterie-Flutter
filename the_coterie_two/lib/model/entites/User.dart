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
}