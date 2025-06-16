import 'package:json_annotation/json_annotation.dart';
import './Group.dart';
import './Person.dart';
import './Tag.dart';
import './Event.dart';

part 'User.g.dart';

@JsonSerializable(explicitToJson: true)
class User extends Person {
  final int userID;
  final Set<Tag> tags;
  final Set<User> friends;
  final Set<Event> eventsAttended;
  final Set<Event> savedEvents;
  final Set<Group> groups;
  final List<String> languages;
  final String countryOfOrigin;

  User({
    required this.userID,
    required this.tags,
    required String name,
    required DateTime dateOfBirth,
    required String gender,
    required String address,
    required String phoneNumber,
    required String email,
    required this.languages,
    required this.countryOfOrigin,
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

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  //TODO: ADD USER BIO TO ATTRIBUTES
  get bio => "Placeholder bio";
  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
  @override
  String toString() => 'User(userID: $userID, userName: $name)';
}