import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../../utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'embeddings_service.g.dart';

@JsonSerializable()
class EmbeddingResponse {
  EmbeddingResponse(this.embedding, this.timestamp, this.model);

  List<double> embedding;
  String timestamp;
  String model;

  factory EmbeddingResponse.fromJson(Map<String, dynamic> json) => _$EmbeddingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EmbeddingResponseToJson(this);

  Future<void> getEmbedding(String text) async {
    try {
      var url = Uri.parse(EMBEDDINGS_ENDPOINT);
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'text': text}),
      );
      
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        EmbeddingResponse model = EmbeddingResponse.fromJson(jsonData);
        print('Embedding: ${model.embedding}');
        print('Model: ${model.model}');
        print('Timestamp: ${model.timestamp}');
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

class EmbeddingsService {
  static Future<void> getEmbedding(String text) async {
    try {
      final response = await http.post(
        Uri.parse(EMBEDDINGS_ENDPOINT),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'text': text}),
      );
      print(response.body);
    } catch (e) {
      print(e);
    }
  }
}

void main() async {
  EmbeddingResponse response = EmbeddingResponse([], "", "");
  await response.getEmbedding("Sample text for embedding");
} 