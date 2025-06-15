// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clustering_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClusteringResponse _$ClusteringResponseFromJson(Map<String, dynamic> json) =>
    ClusteringResponse(
      (json['clusters'] as List<dynamic>)
          .map((e) =>
              (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
          .toList(),
      json['timestamp'] as String,
    );

Map<String, dynamic> _$ClusteringResponseToJson(ClusteringResponse instance) =>
    <String, dynamic>{
      'clusters': instance.clusters,
      'timestamp': instance.timestamp,
    };
