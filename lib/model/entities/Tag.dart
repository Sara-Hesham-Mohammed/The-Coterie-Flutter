import 'package:json_annotation/json_annotation.dart';
import './Category.dart';

part 'Tag.g.dart';

@JsonSerializable(explicitToJson: true)
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

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
  Map<String, dynamic> toJson() => _$TagToJson(this);
}