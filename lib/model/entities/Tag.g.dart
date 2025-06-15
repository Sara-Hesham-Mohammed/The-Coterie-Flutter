// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      tagID: (json['tagID'] as num).toInt(),
      tagName: json['tagName'] as String,
      tagCategory: $enumDecode(_$CategoryEnumMap, json['tagCategory']),
      subCategory: $enumDecodeNullable(_$CategoryEnumMap, json['subCategory']),
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'tagID': instance.tagID,
      'tagName': instance.tagName,
      'tagCategory': _$CategoryEnumMap[instance.tagCategory]!,
      'subCategory': _$CategoryEnumMap[instance.subCategory],
    };

const _$CategoryEnumMap = {
  Category.DefaultInterest: 'DefaultInterest',
  Category.Debating: 'Debating',
  Category.Politics: 'Politics',
  Category.NatureAndOutdoors: 'NatureAndOutdoors',
  Category.Sports: 'Sports',
  Category.HumanitarianWork: 'HumanitarianWork',
  Category.ArtAndCulture: 'ArtAndCulture',
  Category.Literature: 'Literature',
  Category.DanceAndMusic: 'DanceAndMusic',
  Category.Games: 'Games',
};
