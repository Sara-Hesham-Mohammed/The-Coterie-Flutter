import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../../utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../entities/Event.dart';
import '../../entities/User.dart';

part 'clustering_service.g.dart';

@JsonSerializable()
class ClusteringResponse {
  ClusteringResponse(this.clusters, this.timestamp);

  List<List<int>> clusters; // List of user IDs in each cluster
  String timestamp;

  factory ClusteringResponse.fromJson(Map<String, dynamic> json) => _$ClusteringResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ClusteringResponseToJson(this);
}

class ClusteringService {
  static Future<void> clusterEventAttendees(int eventId) async {
    try {
      // First fetch the event with RSVPs from DB
      final eventResponse = await http.get(
        Uri.parse('$DB_ENDPOINT/events/$eventId'),
      );

      if (eventResponse.statusCode == 200) {
        final event = Event.fromJson(jsonDecode(eventResponse.body));
        
        if (event.rsvps != null && event.rsvps!.isNotEmpty) {
          // Get embeddings for all RSVPs
          final embeddingsResponse = await http.post(
            Uri.parse(EMBEDDINGS_ENDPOINT),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'users': event.rsvps!.map((user) => {
                'id': user.userID,
                'tags': user.tags.map((tag) => tag.tagName).toList(),
                'languages': user.languages,
                'countryOfOrigin': user.countryOfOrigin,
              }).toList(),
            }),
          );

          if (embeddingsResponse.statusCode == 200) {
            // Send embeddings to clustering endpoint
            final clusteringResponse = await http.post(
              Uri.parse(CLUSTERING_ENDPOINT),
              headers: {'Content-Type': 'application/json'},
              body: embeddingsResponse.body,
            );

            if (clusteringResponse.statusCode == 200) {
              final clusters = ClusteringResponse.fromJson(jsonDecode(clusteringResponse.body));
              print('Clusters: ${clusters.clusters}');
              print('Timestamp: ${clusters.timestamp}');
            }
          }
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

void main() async {
  await ClusteringService.clusterEventAttendees(1); // Example event ID
} 