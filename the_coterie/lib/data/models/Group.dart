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
}