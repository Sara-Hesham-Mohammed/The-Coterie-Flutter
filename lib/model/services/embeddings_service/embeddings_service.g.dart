// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embeddings_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmbeddingResponse _$EmbeddingResponseFromJson(Map<String, dynamic> json) =>
    EmbeddingResponse(
      (json['embedding'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      json['timestamp'] as String,
      json['model'] as String,
    );

Map<String, dynamic> _$EmbeddingResponseToJson(EmbeddingResponse instance) =>
    <String, dynamic>{
      'embedding': instance.embedding,
      'timestamp': instance.timestamp,
      'model': instance.model,
    };
