import 'package:json_annotation/json_annotation.dart';
import 'person.dart';

part 'Admin.g.dart';

@JsonSerializable()
class Admin extends Person {
  static final Admin _instance = Admin._internal();
  
  factory Admin() => _instance;
  
  Admin._internal() : super(
    name: 'Admin',
    dateOfBirth: DateTime(2000),
    gender: 'N/A',
    address: 'N/A',
    phoneNumber: 'N/A',
    email: 'admin@coterie.com'
  );

  factory Admin.fromJson(Map<String, dynamic> json) => _$AdminFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AdminToJson(this);
}