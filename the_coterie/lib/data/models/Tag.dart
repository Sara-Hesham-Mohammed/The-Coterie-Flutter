import './Category.dart';

class Tag {
  final int tagID;
  final String tagName;
  final Category tagCategory;
  Category? subCategory;

  Tag({
    required this.tagID,
    required this.tagName,
    required this.tagCategory,
    this.subCategory,
  });
}