import './Tag.dart';
import './User.dart';

class Group {
  final int groupID;
  final Set<User> users;
  final Set<Tag> tags;
  final int maxUsers;

  Group({
    required this.groupID,
    required this.users,
    required this.tags,
    required this.maxUsers,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      groupID: json['groupID'],
      users: (json['users'] as List<dynamic>?)
          ?.map((u) => User.fromJson(u))
          .toSet() ?? {},
      tags: (json['tags'] as List<dynamic>?)
          ?.map((t) => Tag.fromJson(t))
          .toSet() ?? {},
      maxUsers: json['maxUsers'],
    );
  }

}