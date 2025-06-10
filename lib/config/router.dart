import 'package:flutter/material.dart';
import 'package:the_coterie/view/screens/browse_page.dart';
import 'package:the_coterie/view/screens/landing_page.dart';
import 'package:the_coterie/view_models/event_view_model.dart';
import '../view/screens/home_page.dart';
import '../view/screens/profile_page.dart';
import '../view/screens/single_event_page.dart';
import '../view/screens/log_in.dart';
import 'package:the_coterie/view/screens/favorites_page.dart';
import 'package:the_coterie/view/screens/sign_up.dart';
import '../utils/skeleton.dart';
import '../view/screens/onboarding_page.dart';

class RouteGenerator {
  static MaterialPageRoute buildRoute(
      String currentRouteName, Widget childWidget, bool addBottomNav) {
    return addBottomNav
        ? MaterialPageRoute(
            builder: (context) => Skeleton(
              currentRoute: currentRouteName,
              bodyWidget: childWidget,
            ),
          )
        : MaterialPageRoute(
            builder: (context) => childWidget,
          );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return buildRoute('/', OnboardingPage(), false);
      case '/login':
        return buildRoute('/login', LogInPage(), false);
      case '/signup':
        return buildRoute('/signup', SignUp(), false);
      case '/landing':
        return buildRoute('/landing', LandingPageView(), false);
      case '/home':
        return buildRoute('/home', HomePage(), true);
      case '/browse':
        return buildRoute('/browse', BrowseSection(), true);
      case '/event':
        return buildRoute('/event', EventPage(), true);
      case '/profile':
        return buildRoute('/profile', ProfilePage(), true);
      case '/favorites':
        return buildRoute('/favorites', FavoriteEventsPage(), true);
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
