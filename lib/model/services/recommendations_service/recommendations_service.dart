import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../../utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../entities/Event.dart';
import '../../entities/User.dart';

part 'recommendations_service.g.dart';

@JsonSerializable()
class RecommendationsResponse {
  RecommendationsResponse(this.recommendedEvents, this.timestamp);

  List<Event> recommendedEvents;
  String timestamp;

  factory RecommendationsResponse.fromJson(Map<String, dynamic> json) => _$RecommendationsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RecommendationsResponseToJson(this);
}

class RecommendationsService {
  static Future<void> getRecommendations(User user) async {
    try {
      // First fetch all events from DB
      final eventsResponse = await http.get(
        Uri.parse('$DB_ENDPOINT/events'),
      );

      if (eventsResponse.statusCode == 200) {
        final List<dynamic> eventsJson = jsonDecode(eventsResponse.body);
        final List<Event> allEvents = eventsJson.map((json) => Event.fromJson(json)).toList();

        // Send user info and events to recommendations endpoint
        final recommendationsResponse = await http.post(
          Uri.parse(RECOMMENDATIONS_ENDPOINT),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'user': {
              'id': user.userID,
              'tags': user.tags.map((tag) => tag.tagName).toList(),
              'languages': user.languages,
              'countryOfOrigin': user.countryOfOrigin,
            },
            'events': allEvents.map((event) => event.toJson()).toList(),
          }),
        );

        if (recommendationsResponse.statusCode == 200) {
          final recommendations = RecommendationsResponse.fromJson(jsonDecode(recommendationsResponse.body));
          print('Recommended Events: ${recommendations.recommendedEvents.length}');
          print('Timestamp: ${recommendations.timestamp}');
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

void main() async {
  // Example user for testing
  final user = User(
    userID: 1,
    tags: {},
    name: 'Test User',
    dateOfBirth: DateTime(2000),
    gender: 'male',
    address: 'Test Address',
    phoneNumber: '1234567890',
    email: 'test@example.com',
    languages: ['English'],
    countryOfOrigin: 'USA',
  );
  
  await RecommendationsService.getRecommendations(user);
} 