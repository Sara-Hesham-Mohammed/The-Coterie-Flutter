import 'package:flutter/material.dart';
import 'package:the_coterie/view/pages/browse_page.dart';
//just trying it out for uni
class RouteGenerator{

  static Future<Route> generateRoute(RouteSettings settings) async {
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> BrowseSection());
      case '/second':
        if(true){
          return MaterialPageRoute(builder: (_)=> BrowseSection());
        }

    }
  }
}