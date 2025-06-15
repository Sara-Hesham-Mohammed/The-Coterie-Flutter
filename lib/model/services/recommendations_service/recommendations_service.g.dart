// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendations_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendationsResponse _$RecommendationsResponseFromJson(
        Map<String, dynamic> json) =>
    RecommendationsResponse(
      (json['recommendedEvents'] as List<dynamic>)
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['timestamp'] as String,
    );

Map<String, dynamic> _$RecommendationsResponseToJson(
        RecommendationsResponse instance) =>
    <String, dynamic>{
      'recommendedEvents': instance.recommendedEvents,
      'timestamp': instance.timestamp,
    };
