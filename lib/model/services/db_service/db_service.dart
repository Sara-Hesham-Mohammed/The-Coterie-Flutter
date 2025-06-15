import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../../utils/constants.dart';
import 'package:json_annotation/json_annotation.dart';


part 'db_service.g.dart';


@JsonSerializable()
class Response{

  Response(this.message, this.timestamp, this.method );

  String message;
  String timestamp;
  String method;


  factory Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);


  Future<void> getText() async{
    try {
      var url = Uri.parse(TEST_ENDPOINT);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        Response model = Response.fromJson(jsonData);
        print(model.message);
        print(model.method);
        print(model.timestamp);
      }
    } catch (e) {
      log(e.toString());
    }
  }

}

class DBService {
  static Future<void> getterFn() async {
    String URL = TEST_ENDPOINT;
    try {
      final response = await http.get(Uri.parse(URL),);
      print(response);
    } catch (e) {
      print(e);
    }
  }
}

void main() async {
  Response response = Response("", "", "");
  await response.getText();
}