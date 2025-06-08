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

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tagID: json['tagID'],
      tagName: json['tagName'],
      tagCategory: Category.values.firstWhere(
        (e) => e.toString().split('.').last == json['tagCategory'],
        orElse: () => Category.DefaultInterest, // fallback if not found
      ),
    );
  }
}
