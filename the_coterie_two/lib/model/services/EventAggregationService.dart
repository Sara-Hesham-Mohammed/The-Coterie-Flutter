import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_coterie/model/entities/Event.dart';

class EventAggregationService{

  //TODO: make it more dynamic and fetch wth id
  String URL = 'http://localhost:3000/';

  //fetch data from API
  Future<Event> fetchEvents() async {
    final response = await http.get(
      Uri.parse(URL),
    );

    if (response.statusCode == 200) {
      //parse the JSON
      return Event.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Event');
    }
  }
}