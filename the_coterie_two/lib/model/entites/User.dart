import './Tag.dart';

class User {
  final int userID;
  final Set<Tag> tags;

  User({
    required this.userID,
    required this.tags,
  });
}