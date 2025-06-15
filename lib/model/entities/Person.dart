import 'package:json_annotation/json_annotation.dart';

part 'Person.g.dart';

@JsonSerializable()
class Person {
  final String name;
  final DateTime dateOfBirth;
  final String gender;
  final String address;
  final String phoneNumber;
  final String email;

  Person({
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.address,
    required this.phoneNumber,
    required this.email,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}