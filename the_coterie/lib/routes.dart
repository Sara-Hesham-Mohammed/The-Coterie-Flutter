import 'package:flutter/material.dart';
import 'package:the_coterie/view/pages/browse_page.dart';
import 'package:the_coterie/view/pages/single_event_page.dart';
import 'package:the_coterie/view/pages/log_in.dart';
import 'package:the_coterie/view/pages/profile_page.dart';
import 'package:the_coterie/view/pages/favorites_page.dart';
import 'package:the_coterie/view/pages/sign_up.dart';
import './view/pages/onboarding_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        //only if not logged in
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case '/login':
        //only if not logged in
        return MaterialPageRoute(builder: (_) => LogInPage());
      case '/signup':
        //only if not logged in
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/browse':
        return MaterialPageRoute(builder: (_) => BrowseSection());
      case '/event':
        // if args are needed use em here
        return MaterialPageRoute(builder: (_) => EventPage());
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());
      case '/favorites':
        return MaterialPageRoute(builder: (_) => FavoriteEventsPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('No route defined for ${settings.name}'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(_, '/onboarding');
                      // Replace '/onboarding' with your actual route name
                    },
                    child: Text('Go to Onboarding'),
                  ),
                ],
              ),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
