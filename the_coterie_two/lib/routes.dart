import 'package:flutter/material.dart';
import 'package:the_coterie/view/pages/browse_page.dart';
import './view/pages/onboarding_page.dart';
//just trying it out for uni

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case '/browse':
        return MaterialPageRoute(builder: (_) => BrowseSection());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
