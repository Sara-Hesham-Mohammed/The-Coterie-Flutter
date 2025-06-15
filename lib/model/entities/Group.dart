import 'package:json_annotation/json_annotation.dart';
import './Tag.dart';
import './User.dart';

part 'Group.g.dart';

@JsonSerializable(explicitToJson: true)
class Group {
  final int groupID;
  final List<User> users;  // Changed from Set to List
  final List<Tag> tags;    // Changed from Set to List

  Group({
    required this.groupID,
    required this.users,
    required this.tags,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);
}

void main() async {
  // Corrected JSON structure with proper objects
  final json = {
    'groupID': 2,
    'users': [
      {
        'userID': 1,
        'name': 'sara',
        'dateOfBirth': '2000-01-01T00:00:00.000Z',
        'gender': 'female',
        'address': '123 Main St',
        'phoneNumber': '1234567890',
        'email': 'sara@example.com',
        'tags': [],
        'friends': [],
        'eventsAttended': [],
        'savedEvents': [],
        'groups': []
      },
      {
        'userID': 2,
        'name': 'jimmy',
        'dateOfBirth': '2000-01-01T00:00:00.000Z',
        'gender': 'male',
        'address': '456 Oak St',
        'phoneNumber': '0987654321',
        'email': 'jimmy@example.com',
        'tags': [],
        'friends': [],
        'eventsAttended': [],
        'savedEvents': [],
        'groups': []
      }
    ],
    'tags': [
      {
        'tagID': 1,
        'tagName': 'debates',
        'tagCategory': 'Debating',
        'subCategory': null
      },
      {
        'tagID': 2,
        'tagName': 'games',
        'tagCategory': 'Games',
        'subCategory': null
      }
    ]
  };

  final responseObj = Group.fromJson(json);
  print(responseObj.users);
}