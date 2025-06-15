// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      json['message'] as String,
      json['timestamp'] as String,
      json['method'] as String,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'message': instance.message,
      'timestamp': instance.timestamp,
      'method': instance.method,
    };
